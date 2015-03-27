def F(n) {
  n == 0 ? 1 : n - M(F(n-1))
}
def M(n) {
  n == 0 ? 0 : n - F(M(n-1))
}

println(F(args[0].toInteger()));
println(M(args[0].toInteger()));
