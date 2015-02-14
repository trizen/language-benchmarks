function fib(n)
    return n<2 and n or fib(n-1)+fib(n-2)
end

print(fib(35));
