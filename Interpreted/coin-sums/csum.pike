int main(int argc, array(string) argv) {
   write(num_paths((int)argv[1], (int)argv[2]) + "\n");
}

int num_paths(int startsum, int lastcoin) {

    if (startsum == 250) {
        return 1;
    }

    int paths = 0;
    foreach(({ 1, 2, 5, 10, 20, 50, 100, 200 }), int coin) {
        if (lastcoin >= coin && startsum <= 250 - coin) {
            paths += num_paths(startsum + coin, coin);
        }
    }

    return paths;
}
