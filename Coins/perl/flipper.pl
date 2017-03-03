use Clist;
use Getopt::Std;
use warnings;
use strict;

our ($opt_c,$opt_f);
getopt('c:f:');
my $error=0;
if ( ! $opt_c || $opt_c < 1 ) {
   print "Use the -c option to specify the number of coins.\n";
   $error=1;
}
if ( ! $opt_f || $opt_f < 1 ) {
   print "Use the -f option to specify the number of flips.\n";
   $error=1;
}
die "Please re-run with the correct parameters" unless $error == 0;

my $coins = Clist->new($opt_c);
my @count;
for ( my $i=0; $i <= $opt_c; $i++) {
   $count[$i] = 0;
}
for ( my $i=0; $i < $opt_f; $i++) {
   $coins->flip_all();
   $count[$coins->count_heads()]++;
}
my $totflips=0;
for ( my $i=0; $i <= $opt_c; $i++) {
   print "I threw ", $i, " heads \t", $count[$i], " times\n" if ($count[$i] > 0);
   $totflips+=$count[$i];
}
print "Total flips = $totflips\n";
