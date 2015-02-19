function tak(x, y, z)
    (y < x ? tak(tak(x - 1, y, z), tak(y - 1, z, x), tak(z - 1, x, y))
           : z)
end

println(tak(int(ARGS[1]),int(ARGS[2]),int(ARGS[3])));
