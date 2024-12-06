for (<STDIN>) {
  push @m, [split(//)];
  if (/\^/) {
    $y = $#m;
    $x = index($_, "^");
    $m[$y][$x] = ".";
    $c = 1;
    $v[$y][$x] = 1;
  }
}
while (1) {
  if ($f == 0) {
    last if $y == 0;
    if ($m[$y-1][$x] eq ".") {
      $y -= 1;
      $c += 1 if $v[$y][$x]++ == 0;
    } else {
      $f += 1;
    }
  } elsif ($f == 1) {
    last if $x == $#{$m[0]} - 1;
    if ($m[$y][$x+1] eq ".") {
      $x += 1;
      $c += 1 if $v[$y][$x]++ == 0;
    } else {
      $f += 1;
    }
  } elsif ($f == 2) {
    last if $y == $#m;
    if ($m[$y+1][$x] eq ".") {
      $y += 1;
      $c += 1 if $v[$y][$x]++ == 0;
    } else {
      $f += 1;
    }
  } else {
    last if $x == 0;
    if ($m[$y][$x-1] eq ".") {
      $x -= 1;
      $c += 1 if $v[$y][$x]++ == 0;
    } else {
      $f = 0;
    }
  }
}
print $c;
