sub recurse {
  my ($t, $o, @v) = @_;
  if ($#v > 0) {
    my $x = shift @v;
    recurse($t, $o + $x, @v) or recurse($t, $o * $x, @v);
  } else {
    $o + $v[0] == $t or $o * $v[0] == $t;
  }
}
while (<STDIN>) {
  ($t, $_) = split(/: /, $_);
  ($o, @v) = split(/ /, $_);
  $s += $t if recurse($t, $o, @v);
}
print $s;
