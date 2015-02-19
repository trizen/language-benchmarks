def tak(x, y, z)
    y < x ? tak(tak(x - 1, y, z), tak(y - 1, z, x), tak(z - 1, x, y))
          : z;
end

puts tak(ARGV[0].to_i, ARGV[1].to_i, ARGV[2].to_i);
