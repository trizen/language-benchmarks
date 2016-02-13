function tak(x, y, z)
    (y < x ? tak(tak(x - 1, y, z), tak(y - 1, z, x), tak(z - 1, x, y))
           : z)
end

println(tak(parse(Int,ARGS[1]),parse(Int,ARGS[2]),parse(Int,ARGS[3])));
