#!/usr/bin/env python

import sys
sys.setrecursionlimit(40000)

def a(k, x1, x2, x3, x4, x5):
    def b():
        b.k -= 1
        return a(b.k, b, x1, x2, x3, x4)
    b.k = k
    return x4() + x5() if b.k <= 0 else b()

x = lambda i: lambda: i
print(a(int(sys.argv[1]), x(1), x(-1), x(-1), x(1), x(0)))
