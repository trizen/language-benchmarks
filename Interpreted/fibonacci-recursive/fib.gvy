def fib(n) {
    n >= 2 ? fib(n-2) + fib(n-1) : n;
}

println(fib(args[0].toInteger()));
