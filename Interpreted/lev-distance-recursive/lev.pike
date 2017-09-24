int main(int argc, array(string) argv) {
   write(leven(argv[1], argv[2]) + "\n");
}

int leven(string s, string t) {

    if (s == "") {
        return sizeof(t);
    }

    if (t == "") {
        return sizeof(s);
    }

    string s1 = s[1..];
    string t1 = t[1..];

    return (
        s[0] == t[0]
            ? leven(s1, t1)
            : 1 + min(
                leven(s1, t1),
                leven(s,  t1),
                leven(s1, t )
            )
    );
}
