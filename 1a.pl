while (<STDIN>) {
  /^(\d+)\s+(\d+)$/;
  push @a, $1;
  push @b, $2;
}
@a = sort {$a <=> $b} @a;
@b = sort {$a <=> $b} @b;
for $i (0 .. $#a) {
  $s += abs($a[$i] - $b[$i]);
}
print $s;
