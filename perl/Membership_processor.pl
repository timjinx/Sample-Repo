use strict;
use Getopt::Std;
our ($opt_f, $opt_o);
my @record;
my ($fh, $oline);
my ($constituency, $branch, $ward, $member, $title, $first_name, $last_name, $full_name);
my ($email, $gender);
getopt('f:o:');
die "Use -f to specify file name, -o to specify output file" unless (defined $opt_f);
die "Unable to open input file " unless (open my $infile, "<", $opt_f);
if ( defined $opt_o ) {
    open ( $fh , ">", $opt_o );
} else {
    $fh = *STDOUT;
}
while (my $line = <$infile>) {
    chomp $line;
    $line =~ s/"//g;
    @record = split(/,/,$line);
    $constituency=$record[2];
    $branch=$record[4];
    $ward=$record[6];
    $ward=~ tr/a-z/A-Z/;
    $member="Yes";
    $member="No" if ($record[9] eq "");
    $full_name=$record[14];
    $title=$record[15];
    $first_name=$record[18];
    $last_name=$record[17];
    $email=$record[28];
    $gender="Male";
    $gender="Female" if ($record[30] eq "F");
    $gender="Other" if ($record[30] eq "O");
    next unless  (grep /@/, $email);
    $oline=$email . "\t" . 
           $first_name . "\t" . 
           $last_name . "\t" .
           $full_name . "\t" .
           $title . "\t" .
           $constituency . "\t" . 
           $branch . "\t" . 
           $ward . "\t" . 
           $gender . "\t" .
           $member;
    print $fh $oline . "\n";
}
close $infile;
close $fh if ( defined $opt_o );
