function lcs(xstr, ystr)

    (xstr == "" || ystr == "") && return "";

    x = xstr[1:1];
    xs = xstr[2:end];
    y = ystr[1:1];
    ys = ystr[2:end];

    x == y && return(x * lcs(xs, ys));

    lcs1 = lcs(xstr, ys);
    lcs2 = lcs(xs, ystr);

    length(lcs1) > length(lcs2) ? lcs1 : lcs2;
end

println(lcs(ARGS[1], ARGS[2]));
