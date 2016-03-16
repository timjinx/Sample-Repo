use Clist;
use Getopt::Std;
getopt('c:f:');
$coins = Clist->new($opt_c);
my @count;
for ( my $i=0; $i <= $opt_c; $i++) {
   $count[$i] = 0;
}
for ( my $i=0; $i < $opt_f; $i++) {
   $coins->flip_all();
   $count[$coins->count_heads()]++;
}
$totflips=0;
for ( my $i=0; $i <= $opt_c; $i++) {
   print "I threw ", $i, " heads \t", $count[$i], " times\n";
   $totflips+=$count[$i];
}
print "Total flips = $totflips\n";