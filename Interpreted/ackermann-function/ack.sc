def ack(m: BigInt, n: BigInt): BigInt = {
  if (m==0) n+1
  else if (n==0) ack(m-1, 1)
  else ack(m-1, ack(m, n-1))
}

println(ack(args(0).toInt, args(0).toInt))
