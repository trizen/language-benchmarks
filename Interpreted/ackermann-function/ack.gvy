def ack ( m, n ) {
    m == 0 ? n + 1 : n == 0 ? ack(m-1, 1) : ack(m-1, ack(m, n-1))
}

println(ack(args[0].toInteger(), args[1].toInteger()));
