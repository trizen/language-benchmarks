def num_paths(startsum,lastcoin) {
    if (startsum == 250) {return 1}
    def paths = 0;
    [1,2,5,10,20,50,100,200].each { coin ->
        if ((lastcoin>=coin) && (startsum<=(250-coin))) {
            paths += num_paths(startsum+coin,coin)
        }
    }
    return paths
}

println(num_paths(0, 250));
