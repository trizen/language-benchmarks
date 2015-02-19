function tak(x, y, z)
    return y<x and tak(tak(x - 1, y, z), tak(y - 1, z, x), tak(z - 1, x, y)) or z
end

print(tak(tonumber(arg[1]), tonumber(arg[2]), tonumber(arg[3])));
