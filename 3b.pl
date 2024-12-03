($_ = join("", <STDIN>)) =~ s/don't\(\).+?do\(\)//sg;
s/don't\(\).+$//s;
while (m/mul\((\d{1,3}),(\d{1,3})\)/g) {
  $s += $1 * $2;
}
print $s;
