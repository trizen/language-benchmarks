def F(n)
  n == 0 ? 1 : n - M(F(n-1))
end
def M(n)
  n == 0 ? 0 : n - F(M(n-1))
end

puts F(ARGV[0].to_i);
puts M(ARGV[0].to_i);
