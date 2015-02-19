sub tak {
    my ($x, $y, $z) = @_;
    $y < $x ? tak(tak($x - 1, $y, $z), tak($y - 1, $z, $x), tak($z - 1, $x, $y))
            : $z;
}

print tak($ARGV[0], $ARGV[1], $ARGV[2]), "\n";
