function num_paths(startsum,lastcoin)
    startsum == 250 && return 1;
    paths = 0;
    for coin in [1,2,5,10,20,50,100,200]
        if ((lastcoin>=coin) && (startsum<=(250-coin)))
            paths += num_paths(startsum+coin,coin)
        end
    end
    return paths
end

println(num_paths(parse(Int,ARGS[1]),parse(Int,ARGS[2])));
