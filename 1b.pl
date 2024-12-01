while (<STDIN>) {
  /^(\d+)\s+(\d+)$/;
  push @a, $1;
  $b{$2}++;
}
for $a (@a) {
  $s += $a * $b{$a};
}
print $s;
