#!/usr/bin/ruby

def fib(n)
    n > 1 ? fib(n-1) + fib(n-2) : n;
end

puts fib(35);
