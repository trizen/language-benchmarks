sub A {
  my ($m, $n) = @_;
  $m == 0 ? $n + 1 :
  $n == 0 ? A($m - 1, 1) :
            A($m - 1, A($m, $n - 1))
}

print A($ARGV[0], $ARGV[1]), "\n";
