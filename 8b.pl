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
      $x{"$y|$x"}++;
      $x{"$yn|$xn"}++;
      $yd = abs($y - $yn);
      $xd = abs($x - $xn);
      if ($xn > $x and $yn > $y) {
        while (($yn += $yd) <= $fy && ($xn += $xd) <= $fx) {
          $x{"$yn|$xn"}++;
        }
        ($yn, $xn) = ($y, $x);
        while (($yn -= $yd) >= 0 && ($xn -= $xd) >= 0) {
          $x{"$yn|$xn"}++;
        }
      } elsif ($xn > $x) {
        while (($yn -= $yd) >= 0 && ($xn += $xd) <= $fx) {
          $x{"$yn|$xn"}++;
        }
        ($yn, $xn) = ($y, $x);
        while (($yn += $yd) <= $fy && ($xn -= $xd) >= 0) {
          $x{"$yn|$xn"}++;
        }
      } elsif ($yn > $y) {
        while (($yn += $yd) <= $fy && ($xn -= $xd) >= 0) {
          $x{"$yn|$xn"}++;
        }
        ($yn, $xn) = ($y, $x);
        while (($yn -= $yd) >= 0 && ($xn += $xd) <= $fx) {
          $x{"$yn|$xn"}++;
        }
      } else {
        while (($yn -= $yd) >= 0 && ($xn -= $xd) >= 0) {
          $x{"$yn|$xn"}++;
        }
        ($yn, $xn) = ($y, $x);
        while (($yn += $yd) <= $fy && ($xn += $xd) <= $fx) {
          $x{"$yn|$xn"}++;
        }
      }
    }
  }
}
print scalar(keys %x);
