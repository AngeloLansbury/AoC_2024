LINE: while (<STDIN>) {
  chomp;
  SUBS: for $m (0 .. length($_) / 2 + 1) {
    @v = split(/ /, $_);
    splice(@v, $m, 1);
    $d = shift @v;
    $p = shift @v;
    $d = $p - $d;
    next SUBS if $d == 0 or abs($d) > 3;
    for $v (@v) {
      next SUBS if ($v - $p) == 0 or abs($v - $p) > 3 or ($v - $p) * $d < 0;
      $p = $v;
    }
    $s++;
    next LINE;
  }
}
print $s;
