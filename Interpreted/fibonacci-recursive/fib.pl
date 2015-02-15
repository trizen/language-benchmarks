sub fib {
    my ($n) = @_;
    $n > 1 ? fib($n-1) + fib($n-2) : $n;
}

print fib($ARGV[0]), "\n";
