#!/usr/bin/perl
use Getopt::Std;
use Try::Tiny;
use warnings;
use strict;
use Cline;

sub main {
   our ($opt_c, $opt_f, $opt_s);
   my $htmp;
   getopts('sc:f:');
   die "Please use specify the number of coins using -c <number of coins>\n" unless (defined $opt_c);
   die "Please use specify the number of flips using -f <number of flips>\n" unless (defined $opt_f);
   
   try {
      die "Number of coins is invalid" unless ( $opt_c eq int($opt_c) && $opt_c > 0 );
   } catch {
      die "Number of coins is invalid";
   };
   try {
      die "Number of flips is invalid" unless ( $opt_f eq int($opt_f) && $opt_f > 0 );
   } catch {
      die "Number of flips is invalid";
   };

   my $coins = Cline->new($opt_c);
   my %coin_count;
   for (my $i=0; $i < $opt_f; $i++) {
      $coins->flipAll();
      my $heads = $coins->countHeads();
      if ( exists  $coin_count{$heads} ) {
         $coin_count{$heads}++;
      } else {
         $coin_count{$heads} = 1;
      }
   }
   my ($key, $value);
   if ( $opt_s ) {
      printf "Sorting by value\n";
      foreach $key ( sort { $coin_count{$a} <=> $coin_count{$b} } keys %coin_count ) {
         $value = $coin_count{$key};
         print "  $key occured $value times\n";
      }
   } else {
      printf "Sorting by key\n";
      foreach $key ( sort  { $a <=> $b } keys(%coin_count)) {
         print "  $key occured $coin_count{$key} times\n";
      }
   }
   exit 0;
}

main();



