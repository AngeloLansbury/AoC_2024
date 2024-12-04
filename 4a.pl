@l = map { [split(//, $_)] } <STDIN>;
for $y (0 .. $#l) {
  for $x (0 .. $#{$l[$y]}) {
    next unless $l[$y][$x] eq 'X';
    if ($y >= 3) {
      if ($x >= 3) {
        $s++ if $l[$y-1][$x-1] eq 'M' and $l[$y-2][$x-2] eq 'A' and $l[$y-3][$x-3] eq 'S';
      }
      $s++ if $l[$y-1][$x] eq 'M' and $l[$y-2][$x] eq 'A' and $l[$y-3][$x] eq 'S';
      if ($x+3 <= $#{$l[$y]}) {
        $s++ if $l[$y-1][$x+1] eq 'M' and $l[$y-2][$x+2] eq 'A' and $l[$y-3][$x+3] eq 'S';
      }
    }
    if ($x >= 3) {
      $s++ if $l[$y][$x-1] eq 'M' and $l[$y][$x-2] eq 'A' and $l[$y][$x-3] eq 'S';
    }
    if ($x+3 <= $#{$l[$y]}) {
      $s++ if $l[$y][$x+1] eq 'M' and $l[$y][$x+2] eq 'A' and $l[$y][$x+3] eq 'S';
    }
    if ($y+3 <= $#l) {
      if ($x >= 3) {
        $s++ if $l[$y+1][$x-1] eq 'M' and $l[$y+2][$x-2] eq 'A' and $l[$y+3][$x-3] eq 'S';
      }
      $s++ if $l[$y+1][$x] eq 'M' and $l[$y+2][$x] eq 'A' and $l[$y+3][$x] eq 'S';
      if ($x+3 <= $#{$l[$y]}) {
        $s++ if $l[$y+1][$x+1] eq 'M' and $l[$y+2][$x+2] eq 'A' and $l[$y+3][$x+3] eq 'S';
      }
    }
  }
}
print $s;
