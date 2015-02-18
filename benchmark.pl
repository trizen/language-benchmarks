#!/usr/bin/perl

# Author: Daniel "Trizen" Șuteu
# License: GPLv3
# Date: 14 February 2015
# Edit: 15 February 2015
# Website: http://github.com/trizen

# Speed comparison of common programming languages.
# The results are stored in separate CSV files for each test.

use 5.014;
use strict;
use autodie;
use warnings;

use Text::CSV qw();
use Text::ParseWords qw(quotewords);

use File::Temp qw(mktemp);
use File::Path qw(make_path);
use File::Basename qw(basename);
use File::Spec::Functions qw(catfile catdir tmpdir curdir updir);

use List::Util qw(min max sum);
use Getopt::Long qw(GetOptions);
use Time::HiRes qw(gettimeofday tv_interval);

# The main directories which contain sub-directories with source files
my $compiled_langs_dir    = 'Compiled';
my $interpreted_langs_dir = 'Interpreted';

# The test specific files
my $arguments_file = 'args.txt';
my $ignore_file    = 'ignore.txt';

# The directories where the reports are written
my $reports_dir             = 'Reports';
my $compiled_reports_dir    = catdir($reports_dir, 'Compiled');
my $interpreted_reports_dir = catdir($reports_dir, 'Interpreted');

# The compilers and intepreters definitions
my $compilers    = do(catfile($compiled_langs_dir,    'compilers.txt'));
my $interpreters = do(catfile($interpreted_langs_dir, 'interpreters.txt'));

# Flags
my $test_compiled    = 0;
my $test_interpreted = 0;
my $repeat_n         = 3;
my $test_name        = '';

sub help {
    print <<"USAGE";
usage: $0 [options]

options:
    -i       : test interpreted languages
    -c       : test compiled languages
    -t name  : run only a specific test
    -r int   : repeat each test this many times (default: $repeat_n)

example:
    $0 -i -r 1 -t "fibonacci-recursive"

USAGE

    exit;
}

GetOptions(
           'i!'     => \$test_interpreted,
           'c!'     => \$test_compiled,
           'r=i'    => \$repeat_n,
           't=s'    => \$test_name,
           'help|h' => \&help,
          )
  or die("Error in command line arguments!");

sub create_cmd {
    my ($cmd, $in, $out) = @_;

    my @new_cmd;
    foreach my $field (@{$cmd}) {
        if (defined $in) {
            if ($field eq '%in' or $field eq '%in%') {
                push @new_cmd, $in;
                next;
            }
        }
        if (defined $out) {
            if ($field eq '%out' or $field eq '%out%') {
                push @new_cmd, $out;
                next;
            }
        }
        push @new_cmd, $field;
    }

    return @new_cmd;
}

sub get_dir_entries {
    my ($dirname) = @_;
    opendir(my $dir_h, $dirname);
    map { $_ => catfile($dirname, $_) }
      grep { $_ ne curdir() and $_ ne updir() } readdir($dir_h);
}

sub files_by_ext {
    my ($ext_array, $files_array) = @_;

    my @files;
    foreach my $file (@{$files_array}) {
        foreach my $ext (@{$ext_array}) {
            if ($file =~ /\.\Q$ext\E\z/i) {
                push @files, $file;
                last;
            }
        }
    }

    return @files;
}

sub get_arguments {
    my ($files_array) = @_;

    my @args;
    foreach my $file (@{$files_array}) {
        if (basename($file) eq $arguments_file) {
            open my $fh, '<:utf8', $file;
            push @args, quotewords(qr/\s+/, 0, unpack('A*', scalar(<$fh>)));
            last;
        }
    }

    return @args;
}

sub get_ignores {
    my ($files_array) = @_;

    my %ignore;
    foreach my $file (@{$files_array}) {
        if (basename($file) eq $ignore_file) {
            open my $fh, '<:utf8', $file;
            while (defined(my $line = <$fh>)) {
                $ignore{unpack 'A*', $line} = 1;
            }
            last;
        }
    }

    return %ignore;
}

sub map_files_to_dirs {
    my (%entries) = @_;

    my %files;
    while (my ($key, $dir) = each %entries) {
        if (-d $dir) {
            my %dir_entries = get_dir_entries($dir);
            my @files = map { $dir_entries{$_} } grep { -f $dir_entries{$_} } keys %dir_entries;
            @files ? (push @{$files{$key}}, @files) : ();
        }
    }

    return %files;
}

sub execute_cmd {
    system(@_) == 0;
}

sub time_cmd {
    my ($seconds, $microseconds) = gettimeofday();
    execute_cmd(@_) || return -1;
    tv_interval([$seconds, $microseconds], [gettimeofday()]);
}

sub mMavg {
    (min(@_), max(@_), sum(@_) / @_);
}

sub write_report {
    my ($report_ref, $report_dir) = @_;

    my $csv = Text::CSV->new(
                             {
                              eol      => "\n",
                              binary   => 1,
                              sep_char => ',',
                             }
                            )
      or die "Cannot use CSV: " . Text::CSV->error_diag();

    my @columns = qw(
      language
      file
      time_min
      time_max
      time_avg
      );

    # Create the report dir (if needed)
    if (not -d $report_dir) {
        make_path($report_dir);
    }

    foreach my $name (keys %{$report_ref}) {
        my $csv_file = catfile($report_dir, $name . '.csv');
        open my $fh, '>:encoding(UTF-8)', $csv_file;

        # Print the CSV columns
        $csv->print($fh, \@columns);

        while (my ($file, $langs) = each %{$report_ref->{$name}}) {
            while (my ($lang, $data) = each %{$langs}) {

                # Set the row values
                my %row = (
                           language => $lang,
                           file     => basename($file),
                          );

                my @time_keys = qw(time_min time_max time_avg);
                @row{@time_keys} = @{$data}{@time_keys};

                # Print the CSV row
                $csv->print($fh, [@row{@columns}]);
            }
        }

        close $fh;    # close the report
    }

    return 1;
}

sub start_test {
    my ($languages_dir, $executors, $compile_bool) = @_;

    my %report;
    my %entries = get_dir_entries($languages_dir);
    my %files   = map_files_to_dirs(%entries);

    foreach my $name (sort keys %files) {

        # Run only a specific test name
        if ($test_name ne '') {
            basename($test_name) eq $name or next;
        }

        printf("=>> Running test: %s\n", $name);

        foreach my $i (0 .. $#{$executors}) {

            my $executor = $executors->[$i];
            my $lang     = $executor->{lang};
            printf("\n[%s of %s] Testing language: %s\n", $i + 1, $#{$executors} + 1, $lang);

            my @args   = get_arguments($files{$name});
            my %ignore = get_ignores($files{$name});
            my @files  = files_by_ext($executor->{ext}, $files{$name});

            if (@files == 0) {
                warn sprintf(" `-> no file has been found with the extension%s: %s\n",
                             @{$executor->{ext}} > 1 ? 's' : '', join(', ', @{$executor->{ext}}));
                next;
            }

            foreach my $input_file (@files) {

                my $basename = basename($input_file);
                if (exists $ignore{$basename}) {
                    printf(" `-> ignoring file: %s\n", $basename);
                    next;
                }

                my @run_cmd;
                my $temp_file;

                # Case for compiled languages
                if ($compile_bool) {
                    printf(" `-> compilling file: %s\n", $input_file);

                    my $output_file = mktemp(catfile(tmpdir, 'XXXXXXXX'));
                    my @cmd = create_cmd($executor->{cmd}, $input_file, $output_file);

                    # Compile the program
                    execute_cmd(@cmd)
                      || do {
                        warn "[!] Error ($!) in executing the command: @cmd\n";
                        next;
                      };

                    if (not -x $output_file) {
                        warn "[!] The output file ($output_file) is not executable!\n";
                        next;
                    }

                    $temp_file = $output_file;
                    push @run_cmd, $output_file;
                }

                # Case for interpreted languages
                else {
                    push @run_cmd, create_cmd($executor->{cmd}, $input_file);
                }

                printf(" `-> testing %d times: %s\n", $repeat_n, basename($input_file));

                # The array used to store the elapsed times
                my @times;

                # Run the test N times and store the elapsed times
                foreach my $i (1 .. $repeat_n) {
                    my $elapsed_time = time_cmd(@run_cmd, @args);
                    if ($elapsed_time == -1) {
                        warn "[!] An error occurred while executing the command: @run_cmd\n";
                        last;
                    }
                    push @times, $elapsed_time;
                }

                # Delete the compiled file
                if ($compile_bool and defined $temp_file) {
                    unlink($temp_file);
                }

                # Store the collected data
                if (@times > 0) {
                    my $report_name = join(' ', $name, map { s{/}{%}r } @args);
                    @{$report{$report_name}{$input_file}{$lang}}{qw(time_min time_max time_avg)} = mMavg(@times);
                }
                else {
                    warn "[!] No test has been timed! Skipping file...\n";
                    next;
                }
            }
        }
    }

    return %report;
}

#
## Test the compiled langauges
#
if ($test_compiled) {
    my %report = start_test($compiled_langs_dir, $compilers, 1);

    if (%report) {
        print "\n** Generating the reports for compiled languages...\n";
        write_report(\%report, $compiled_reports_dir);
        print "** Done!\n";
    }
    else {
        warn "\n** No report has been generated for compiled languages!\n";
    }
}

#
## Test the interpreted languages
#
if ($test_interpreted) {
    my %report = start_test($interpreted_langs_dir, $interpreters, 0);

    if (%report) {
        print "\n** Generating the reports for interpreted languages...\n";
        write_report(\%report, $interpreted_reports_dir);
        print "** Done!\n";
    }
    else {
        warn "\n** No report has been generated for interpreted languages!\n";
    }
}

if (not $test_compiled and not $test_interpreted) {
    help();
}
