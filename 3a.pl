$_ = join("", <STDIN>);
while (m/mul\((\d{1,3}),(\d{1,3})\)/g) {
  $s += $1 * $2;
}
print $s;
