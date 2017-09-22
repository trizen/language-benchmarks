int main(int argc, array(string) argv) {
   write(lcs(argv[1], argv[2]) + "\n");
}

string lcs(string xstr, string ystr) {

    if (xstr == "" || ystr == "") {
        return "";
    }

    string x = xstr[0..0];
    string y = ystr[0..0];

    string xs = xstr[1..];
    string ys = ystr[1..];

    if (x == y) {
        return (x + lcs(xs, ys));
    }

    string lcs1 = lcs(xstr, ys);
    string lcs2 = lcs(xs,   ystr);

    return (sizeof(lcs1) > sizeof(lcs2) ? lcs1 : lcs2);
}
