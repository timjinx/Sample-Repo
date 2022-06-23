use strict;
use warnings;
use Getopt::Std;
our ($opt_f);
my ($line);
getopt('f:n:c:');
die "Please enter a file to process using -f <filename>\n" unless (defined $opt_f);
die "Unable to open input file " unless (open my $infile, "<", $opt_f);
die "Unable to open output file " unless (open my $oufile, ">", $opt_f . ".out");
while (<$infile>) {
    chomp;
    $line = $_;
    print $oufile $line;
}
close $infile;
print $oufile "\n";
close $oufile;
