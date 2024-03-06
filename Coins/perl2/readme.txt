To run you have to include the local directory in the library path

perl -I . flipper.pl -c 30 -f 20

$ perl -I . flipper.pl -c 10 -f 25
Sorting by key
  3 occured 1 times
  4 occured 2 times
  5 occured 11 times
  6 occured 8 times
  7 occured 2 times
  8 occured 1 times
$

$ perl -I . flipper.pl -c 10 -f 25 -s
Sorting by value
  1 occured 1 times
  2 occured 1 times
  3 occured 1 times
  7 occured 3 times
  4 occured 5 times
  6 occured 6 times
  5 occured 8 times
$
