def num_paths(startsum,lastcoin):
    if (startsum==250): return 1
    paths = 0
    for coin in [1,2,5,10,20,50,100,200]:
        if ((lastcoin>=coin) and (startsum<=(250-coin))):
            paths += num_paths(startsum+coin,coin)

    return paths

print(num_paths(0,250))
