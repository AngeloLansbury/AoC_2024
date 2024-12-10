@m = map {
  chop;
  [split(//, $_)];
} (<STDIN>);

sub trailheads {
  my @t = ();
  for $y (0 .. $#m) {
    for $x (0 .. $#{$m[0]}) {
      push(@t, [$y, $x]) if $m[$y][$x] == 0;
    }
  }
  @t;
}

sub count_trails {
  my ($y, $x, $v) = @_;
  $v++;
  if ($y > 0 and $m[$y-1][$x] == $v) {
    $v == 9 ? $r++ : count_trails($y-1, $x, $v);
  }
  if ($x > 0 and $m[$y][$x-1] == $v) {
    $v == 9 ? $r++ : count_trails($y, $x-1, $v);
  }
  if ($y < $#m and $m[$y+1][$x] == $v) {
    $v == 9 ? $r++ : count_trails($y+1, $x, $v);
  }
  if ($x < $#{$m[0]} and $m[$y][$x+1] == $v) {
    $v == 9 ? $r++ : count_trails($y, $x+1, $v);
  }
}

for $t (trailheads) {
  $r = 0;
  count_trails(@{$t}, 0);
  $s += $r;
}
print $s;
