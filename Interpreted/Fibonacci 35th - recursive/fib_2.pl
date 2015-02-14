#!/usr/bin/perl

sub fib {
    $_[0] < 2 ? $_[0] : fib($_[0]-1) + fib($_[0]-2);
}

print fib(35), "\n";
