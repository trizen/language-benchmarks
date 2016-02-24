def tak(x:Int, y:Int, z:Int):Int = {
    if (y < x) {
        return tak(tak(x - 1, y, z), tak(y - 1, z, x), tak(z - 1, x, y))
    }
    else {
        return z;
    }
};

println(tak(args(0).toInt, args(1).toInt, args(2).toInt));
