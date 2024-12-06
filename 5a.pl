while ($_ = <STDIN>) {
  last unless /(\d+)\|(\d+)/;
  $o{$1} = [] unless defined($o{$1});
  push @{$o{$1}}, $2;
}

PAGE: while ($l = <STDIN>) {
  chomp($_ = $l);
  ($_ = ",$_,") =~ s/,/,,/g;
  for $k (keys %o) {
    next unless /,$k,/;
    for $t (@{$o{$k}}) {
      next PAGE if /,$t,/ and !/,$k,.*,$t,/;
    }
  }
  @p = split(/,/, $l);
  $s += $p[$#p/2];
}
print $s;
