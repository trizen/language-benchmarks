import sys

def leven(s, t):

    if s == '': return len(t)
    if t == '': return len(s)

    s1 = s[1:]
    t1 = t[1:]

    if s[0] == t[0]:
        return leven(s1, t1)

    return 1 + min(
        leven(s,  t1),
        leven(s1, t ),
        leven(s1, t1)
    )

print(leven(sys.argv[1], sys.argv[2]))
