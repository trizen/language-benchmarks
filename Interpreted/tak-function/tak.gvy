def tak(x, y, z) {
    y < x ? tak(tak(x - 1, y, z), tak(y - 1, z, x), tak(z - 1, x, y))
          : z;
}

println(tak(args[0].toInteger(), args[1].toInteger(), args[2].toInteger()));
