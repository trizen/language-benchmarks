
def min(a:Int, b:Int, c:Int) = Math.min( Math.min( a, b ), c)
def sd(s1: List[Char], s2: List[Char]): Int = (s1, s2) match {
    case (_, Nil) => s1.length
    case (Nil, _) => s2.length
    case (c1::t1, c2::t2)  => min( sd(t1,s2) + 1, sd(s1,t2) + 1,
                                   sd(t1,t2) + (if (c1==c2) 0 else 1) )
}

println(sd(args(0).toList, args(1).toList))
