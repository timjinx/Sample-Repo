#!/usr/bin/perl
use strict;
use Getopt::Std;
use Scalar::Util qw(looks_like_number);
my ($r_m, $d_m, $top_line, $bottom_line, $mp, $ap);
our ($opt_a, $opt_r, $opt_d);
getopt('a:r:d:');
die "Please use -a to input the mortgage amount\n" unless (defined $opt_a);
die "Please use -r to input the annual interest rate\n" unless (defined $opt_r);
die "Please use -d to input the duration of the mortgage in years\n" unless (defined $opt_d);
die "Please ensure that the amount is numeric\n" unless looks_like_number($opt_a);
die "Please ensure that the rate is numeric\n" unless looks_like_number($opt_r);
die "Please ensure that the duration is numeric\n" unless looks_like_number($opt_d);
if ( ( $opt_a == 0 ) || ( $opt_r == 0 ) || ( $opt_d == 0 ) ) 
{
   die "Please ensure that there are no zero values\n";
}

$r_m = $opt_r / 12; ## Interest rate expressed monthky
$d_m = $opt_d * 12; ## Duration in months
$top_line = ( $opt_a * $r_m * ( 1 + ( $r_m / 100 ))**$d_m );
$bottom_line = 100 * (( (1 + ( $r_m / 100 ))**$d_m) -1);
$mp = $top_line / $bottom_line ;
$ap = $mp * 12;

printf("Annual replayments will be £%.2f\n", $ap);
printf("Monthly replayments will be £%.2f\n",$mp);
printf("Total cost of loan will be £%.2f\n", $ap * $opt_d );
