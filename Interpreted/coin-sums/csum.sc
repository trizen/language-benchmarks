def num_paths(startsum:Int,lastcoin:Int):Int = {
    if (startsum == 250) {return 1}
    var paths = 0;
    for (coin <- List(1,2,5,10,20,50,100,200)) {
        if ((lastcoin>=coin) && (startsum<=(250-coin))) {
            paths += num_paths(startsum+coin,coin)
        }
    }
    return paths
}

println(num_paths(args(0).toInt, args(1).toInt));
