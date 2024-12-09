@m = <STDIN>;
for $l (0 .. $#m) {
  while ($m[$l] =~ /(\w)/g) {
    $a{$1} = [] if !defined($a{$1});
    push @{$a{$1}}, [$l, pos($m[$l])-1];
  }
}
$fy = $#m;
$fx = length($m[0]) - 2;

for $a (keys %a) {
  for $p (0 .. $#{$a{$a}}) {
    ($y, $x) = @{${$a{$a}}[$p]};
    for $n ($p+1 .. $#{$a{$a}}) {
      ($yn, $xn) = @{${$a{$a}}[$n]};
      $yd = abs($y - $yn);
      $xd = abs($x - $xn);
      if ($xn > $x and $yn > $y) {
        $ya = $yn + $yd;
        $xa = $xn + $xd;
        $yb = $y - $yd;
        $xb = $x - $xd;
      } elsif ($xn > $x) {
        $ya = $yn - $yd;
        $xa = $xn + $xd;
        $yb = $y + $yd;
        $xb = $x - $xd;
      } elsif ($yn > $y) {
        $ya = $yn + $yd;
        $xa = $xn - $xd;
        $yb = $y - $yd;
        $xb = $x + $xd;
      } else {
        $ya = $yn - $yd;
        $xa = $xn - $xd;
        $yb = $y + $yd;
        $xb = $x + $xd;
      }
      $x{"$ya|$xa"}++ if $ya >= 0 && $ya <= $fy && $xa >= 0 && $xa <= $fx;
      $x{"$yb|$xb"}++ if $yb >= 0 && $yb <= $fy && $xb >= 0 && $xb <= $fx;
    }
  }
}
print scalar(keys %x);
