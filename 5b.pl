while ($_ = <STDIN>) {
  last unless /(\d+)\|(\d+)/;
  $o{$1} = [] unless defined($o{$1});
  push @{$o{$1}}, $2;
}

PAGE: while ($_ = <STDIN>) {
  chomp;
  @v = split(/,/, $_);
  ($_ = ",$_,") =~ s/,/,,/g;
  for $k (keys %o) {
    next unless /,$k,/;
    for $t (@{$o{$k}}) {
      if (/,$t,/ and !/,$k,.*,$t,/) {
        @s = (shift @v);
        VAL: while ($v = shift @v) {
          $p = join(":", "", @{$o{$v}}, "");
          for $i (0 .. $#s) {
            if ($p =~ /:$s[$i]:/) {
              splice(@s, $i, 0, $v);
              next VAL;
            }
          }
          push @s, $v;
        }
        $s += $s[$#s/2];
        next PAGE;
      }
    }
  }
}
print $s;
