function a(k::Int, x1, x2, x3, x4, x5)
  b = ()-> a(k-=1, b, x1, x2, x3, x4);
  k <= 0 ? (x4() + x5()) : b();
end

println(a(int(ARGS[1]), ()->1, ()->-1,  ()->-1, ()->1, ()->0));
