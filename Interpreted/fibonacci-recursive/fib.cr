def fib(n)
    n > 1 ? fib(n-1) + fib(n-2) : n;
end

puts fib(ARGV[0].to_i);
