#!/usr/bin/perl

use 5.010;
use strict;
use autodie;
use warnings;

use Text::CSV;
use List::Util qw(uniq);
use File::Basename qw(basename);

my $csv = Text::CSV->new ( {
        binary => 1,
        sep_char => ',',
        allow_whitespace => 1,
        empty_is_undef => 1,
        blank_is_undef => 1,
        eol => "\n",
} ) or die "Cannot use CSV: ".Text::CSV->error_diag ();

my $dir = shift(@ARGV) || die "usage: $0 [dir]\n";

my %report;

foreach my $csv_file(glob("$dir/*.csv")) {

    my $basename = basename($csv_file);
    open my $fh, '<:utf8', $csv_file;

    $csv->column_names(@{$csv->getline($fh)});

    while (my $row = $csv->getline_hr($fh)) {
        $report{$row->{language}}{$basename} = $row->{time_avg};
    }
}

my @langs = sort {lc($a) cmp lc($b) } keys %report;
my @tasks = sort {lc($a) cmp lc($b) } uniq(map{ keys %{$report{$_}} } @langs);

open my $fh, '>:utf8', 'all.csv';

$csv->print($fh, ['', @tasks]);

foreach my $lang(@langs) {
    $csv->print($fh, [$lang, map{$report{$lang}{$_} }@tasks]);
}
