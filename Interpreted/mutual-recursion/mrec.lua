function f(n) return n == 0 and 1 or n - m(f(n-1)) end
function m(n) return n == 0 and 0 or n - f(m(n-1)) end

print(f(tonumber(arg[1])));
print(m(tonumber(arg[1])));
