sub num_paths {
    my ($startsum, $lastcoin) = @_;

    return 1 if $startsum == 250;

    my $paths = 0;
    foreach my $coin (1, 2, 5, 10, 20, 50, 100, 200) {
        if ($lastcoin >= $coin and $startsum <= 250 - $coin) {
            $paths += num_paths($startsum + $coin, $coin);
        }
    }

    $paths;
}

print num_paths(0, 250), "\n";
