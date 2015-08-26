def a(k, x1, x2, x3, x4, x5)
  b = lambda { k -= 1; a(k, b, x1, x2, x3, x4) }
  k <= 0 ? x4[] + x5[] : b[]
end

puts a(ARGV[0].to_i, lambda {1}, lambda {-1}, lambda {-1}, lambda {1}, lambda {0})
