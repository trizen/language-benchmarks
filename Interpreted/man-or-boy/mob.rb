def a(k, x1, x2, x3, x4, x5)
  b = ->() { k -= 1; a(k, b, x1, x2, x3, x4) }
  k <= 0 ? x4.call + x5.call : b.call
end

puts a(ARGV[0].to_i, -> {1}, -> {-1}, -> {-1}, -> {1}, -> {0})
