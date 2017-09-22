
use experimental qw(signatures);

sub F($n) { $n == 0 ? 1 : $n - M(F($n-1)) }
sub M($n) { $n == 0 ? 0 : $n - F(M($n-1)) }

print F($ARGV[0]), "\n";
print M($ARGV[0]), "\n";
