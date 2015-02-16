sub F { $_[0] ? $_[0] - M(F($_[0]-1)) : 1 }
sub M { $_[0] ? $_[0] - F(M($_[0]-1)) : 0 }

print F($ARGV[0]), "\n";
print M($ARGV[0]), "\n";
