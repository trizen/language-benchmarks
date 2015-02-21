sub lcs {
    my ($xstr, $ystr) = @_;
    ($xstr eq '' or $ystr eq '') && return '';

    my ($x, $xs, $y, $ys) = (substr($xstr, 0, 1), substr($xstr, 1),
                             substr($ystr, 0, 1), substr($ystr, 1));

    if ($x eq $y) {
        return ($x . lcs($xs, $ys));
    }

    my $lcs1 = lcs($xstr, $ys);
    my $lcs2 = lcs($xs,   $ystr);
    length($lcs1) > length($lcs2) ? $lcs1 : $lcs2;
}

print lcs($ARGV[0], $ARGV[1]), "\n";
