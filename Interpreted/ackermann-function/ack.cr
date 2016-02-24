def ack(m : Int, n : Int)
  if m == 0
    n + 1
  elsif n == 0
    ack(m-1, 1)
  else
    ack(m-1, ack(m, n-1))
  end
end

puts ack(ARGV[0].to_i, ARGV[1].to_i)
