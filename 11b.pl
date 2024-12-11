$l_10 = log(10);
for (split(/ /, <STDIN>)) {
  $b{$_}++;
}

for $i (0 .. 74) {
  %n = ();
  for $k (keys %b) {
    if ($k == 0) {
      $n{1} += $b{$k};
    } else {
      $l = int(log($k) / $l_10);
      if ($l % 2 == 1) {
        $l = 10 ** (($l + 1) / 2);
        $n{$k % $l} += $b{$k};
        $n{int($k / $l)} += $b{$k};
      } else {
        $n{$k * 2024} += $b{$k};
      }
    }
  }
  %b = %n;
}
map { $s += $_ } values %b;
print $s;
