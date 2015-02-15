function fib(n)
    return n>1 and fib(n-1)+fib(n-2) or n
end

print(fib(tonumber(arg[1])));
