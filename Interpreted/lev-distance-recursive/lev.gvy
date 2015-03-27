def leven(s, t) {

    if (s == "") {return t.size()}
    if (t == "") {return s.size()}

    def s1 = s.size() > 1 ? s[1..-1] : "";
    def t1 = t.size() > 1 ? t[1..-1] : "";

    s[0] == t[0]
        ? leven(s1, t1)
        : 1 + [
                leven(s1, t1),
                leven(s,  t1),
                leven(s1,  t)
              ].min()
}

println(leven(args[0], args[1]));
