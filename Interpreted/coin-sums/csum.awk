
BEGIN {
    coins[1] = 1;
    coins[2] = 2;
    coins[3] = 5;
    coins[4] = 10;
    coins[5] = 20;
    coins[6] = 50;
    coins[7] = 100;
    coins[8] = 200;
}

function num_paths(startsum, lastcoin, paths) {

    if (startsum == 250) {
        return 1;
    }

    paths = 0;
    for (i in coins) {
        if (lastcoin >= coins[i] && startsum <= 250-coins[i]) {
            paths += num_paths(startsum + coins[i], coins[i]);
        }
    }

    return paths;
}

BEGIN {
    a = ARGV[1];
    b = ARGV[2];
    print num_paths(a, b);
}
