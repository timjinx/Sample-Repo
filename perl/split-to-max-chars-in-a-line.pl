use strict;
use warnings;
use Getopt::Std;
our ($opt_f, $opt_c);
my ($line);
getopt('f:n:c:');
die "Please enter a file to process using -f <filename>\n" unless (defined $opt_f);
die "Please enter a max line lenght using -c <number of characters>\n" unless (defined $opt_c);
die "Unable to open input file " unless (open my $infile, "<", $opt_f);
die "Unable to open output file " unless (open my $oufile, ">", $opt_f . ".out");
my $oline;
while (<$infile>) {
    chomp;
    $line = $_;
    while (length($line) > $opt_c) {
       $oline = substr($line, 0, $opt_c);
       print $oufile $oline . "\n";
       $line = substr($line, $opt_c, length($line));
    }
    print $oufile $line . "\n";
}
close $infile;
close $oufile;
