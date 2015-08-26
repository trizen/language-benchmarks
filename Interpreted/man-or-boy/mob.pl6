sub A(Int $k is copy, &x1, &x2, &x3, &x4, &x5) {
    $k <= 0
        ?? x4() + x5()
        !! (my &B = { A(--$k, &B, &x1, &x2, &x3, &x4) })();
};

say A(Int(@*ARGS[0]), {1}, {-1}, {-1}, {1}, {0});
