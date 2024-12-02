LINE: while (<STDIN>) {
  chomp;
  @v = split(/ /, $_);
  $d = shift @v;
  $p = shift @v;
  $d = $p - $d;
  next LINE if $d == 0 or abs($d) > 3;
  for $v (@v) {
    next LINE if ($v - $p) == 0 or abs($v - $p) > 3 or ($v - $p) * $d < 0;
    $p = $v;
  }
  $s++;
}
print $s;
