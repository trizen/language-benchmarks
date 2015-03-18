def lcs(xstr, ystr)

    xstr.empty? || ystr.empty? and return "";

    x = xstr[0];
    xs = xstr[1..-1];
    y = ystr[0];
    ys = ystr[1..-1];

    x == y and return(x + lcs(xs, ys));

    lcs1 = lcs(xstr, ys);
    lcs2 = lcs(xs, ystr);

    lcs1.size > lcs2.size ? lcs1 : lcs2;
end

puts lcs(ARGV[0], ARGV[1]);
