def f(n)
  n == 0 ? 1 : n - m(f(n-1))
end
def m(n)
  n == 0 ? 0 : n - f(m(n-1))
end

puts f(ARGV[0].to_i);
puts m(ARGV[0].to_i);
