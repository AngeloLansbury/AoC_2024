for (<STDIN>) {
  push @m, [split(//)];
  if (/\^/) {
    $yi = $#m;
    $xi = index($_, "^");
    $fi = 1;
  }
}

sub check_loops {
  my ($o, $x, $y, $f) = @_;
  my %t = ();
  my %b = ();
  my $c = 0;
  while (1) {
    if ($f == 1) {
      last if $y == 0;
      if ($m[$y-1][$x] ne "#") {
        if ($o == 0 and $m[$y-1][$x] eq "." and !defined($b{"$x|" . ($y-1)})) {
          $b{"$x|" . ($y-1)} = 1;
          $m[$y-1][$x] = "#";
          $c += check_loops(1, $x, $y, $f);
          $m[$y-1][$x] = ".";
        }
        $y -= 1;
        return 1 if $o == 1 and ($t{"$x|$y"} & $f) == $f;
        $t{"$x|$y"} |= $f;
      } else {
        $f <<= 1;
      }
    } elsif ($f == 2) {
      last if $x == $#{$m[0]} - 1;
      if ($m[$y][$x+1] ne "#") {
        if ($o == 0 and $m[$y][$x+1] eq "." and !defined($b{"" . ($x+1) . "|$y"})) {
          $b{"" . ($x+1) . "|$y"} = 1;
          $m[$y][$x+1] = "#";
          $c += check_loops(1, $x, $y, $f);
          $m[$y][$x+1] = ".";
        }
        $x += 1;
        return 1 if $o == 1 and ($t{"$x|$y"} & $f) == $f;
        $t{"$x|$y"} |= $f;
      } else {
        $f <<= 1;
      }
    } elsif ($f == 4) {
      last if $y == $#m;
      if ($m[$y+1][$x] ne "#") {
        if ($o == 0 and $m[$y+1][$x] eq "." and !defined($b{"$x|" . ($y+1)})) {
          $b{"$x|" . ($y+1)} = 1;
          $m[$y+1][$x] = "#";
          $c += check_loops(1, $x, $y, $f);
          $m[$y+1][$x] = ".";
        }
        $y += 1;
        return 1 if $o == 1 and ($t{"$x|$y"} & $f) == $f;
        $t{"$x|$y"} |= $f;
      } else {
        $f <<= 1;
      }
    } else {
      last if $x == 0;
      if ($m[$y][$x-1] ne "#") {
        if ($o == 0 and $m[$y][$x-1] eq "." and !defined($b{"" . ($x-1) . "|$y"})) {
          $b{"" . ($x-1) . "|$y"} = 1;
          $m[$y][$x-1] = "#";
          $c += check_loops(1, $x, $y, $f);
          $m[$y][$x-1] = ".";
        }
        $x -= 1;
        return 1 if $o == 1 and ($t{"$x|$y"} & $f) == $f;
        $t{"$x|$y"} |= $f;
      } else {
        $f = 1;
      }
    }
  }
  $c;
}

print check_loops(0, $xi, $yi, $fi);
