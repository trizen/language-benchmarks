BEGIN {
    print lcs(ARGV[1], ARGV[2]);
}

function lcs(xstr, ystr, lcs1, lcs2, l1, l2, x,xs,y,ys) {

    l1 = length(xstr);
    l2 = length(ystr);
    if(l1 == 0 || l2 == 0) {
        return "";
    }

    x = substr(xstr, 1, 1);
    xs = substr(xstr, 2, l1);
    y = substr(ystr, 1, 1);
    ys = substr(ystr, 2, l2);

    if (x == y) {
        return (x lcs(xs, ys));
    }

    lcs1 = lcs(xstr, ys);
    lcs2 = lcs(xs,   ystr);
    return(length(lcs1) > length(lcs2) ? lcs1 : lcs2);
}
