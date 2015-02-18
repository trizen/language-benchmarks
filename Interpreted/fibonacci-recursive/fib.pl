sub fib {
    $_[0] > 1 ? fib($_[0]-1) + fib($_[0]-2) : $_[0];
}

print fib($ARGV[0]), "\n";
