fib(n) = n > 1 ? fib(n-1) + fib(n-2) : n;

println(fib(parse(Int, ARGS[1])));
