function leven(s, t)

    s == "" && return length(t);
    t == "" && return length(s);

    s1 = s[2:end];
    t1 = t[2:end];

    return (s[1] == t[1]
        ? leven(s1, t1)
        : 1 + min(
                leven(s1, t1),
                leven(s,  t1),
                leven(s1,  t)
              )
       );
end

println(leven(ARGS[1], ARGS[2]));
