@l = map { [split(//, $_)] } <STDIN>;
for $y (1 .. $#l-1) {
  for $x (1 .. $#{$l[$y]}-1) {
    next unless $l[$y][$x] eq 'A' and
                $l[$y-1][$x-1] eq 'M' || $l[$y-1][$x-1] eq 'S' and
                $l[$y+1][$x-1] eq 'M' || $l[$y+1][$x-1] eq 'S';
    if ($l[$y-1][$x-1] eq $l[$y+1][$x-1]) {
      $t = $l[$y-1][$x-1] eq 'M' ? 'S' : 'M';
      next unless $l[$y+1][$x+1] eq $t and
                  $l[$y-1][$x+1] eq $t;
    }
    else {
      next unless $l[$y+1][$x+1] eq $l[$y+1][$x-1] and
                  $l[$y-1][$x+1] eq $l[$y-1][$x-1];
    }
    $s++;
  }
}
print $s;
