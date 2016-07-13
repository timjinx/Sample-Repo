#!/usr/bin/perl
use strict;
use warnings;
use Getopt::Std;
our ($opt_f, $opt_n, $opt_c);
my ($line);
getopt('f:n:c:');
die "Please enter a file to process using -f <filename>\n" unless (defined $opt_f);
die "Please enter a new name using -n <name>\n" unless (defined $opt_n);
die "Please enter the name to change using -c <name>\n" unless (defined $opt_c);
die "Unable to open input file " unless (open my $infile, "<", $opt_f);
die "Unable to open output file " unless (open my $oufile, ">", $opt_f . ".out");
while (<$infile>) {
    chomp;
    $line = $_;
    $line =~ s/$opt_c/$opt_n/g;
    print $oufile $line . "\n";
}
close $infile;
close $oufile;
