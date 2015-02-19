function tak(x, y, z) {
    if (y < x) return tak(tak(x - 1, y, z), tak(y - 1, z, x), tak(z - 1, x, y));
    return z;
}

BEGIN {
    print tak(ARGV[1], ARGV[2], ARGV[3]);
}
