#!/usr/bin/perl

use 5.010;

sub fib {
    my ($n) = @_;
    $n > 1 ? fib($n-1) + fib($n-2) : $n;
}

say fib(35);
