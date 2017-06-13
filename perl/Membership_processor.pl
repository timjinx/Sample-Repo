use strict;
use Getopt::Std;
our $opt_f;
my @record;
my ($constituency, $branch, $ward, $member, $title, $first_name, $last_name, $full_name);
my ($email, $gender);
getopt('f:');
die "Use -f to specify file name" unless (defined $opt_f);
die "Unable to open input file " unless (open my $infile, "<", $opt_f);
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
    print $email . "\t" . 
          $first_name . "\t" . 
          $last_name . "\t" .
          $full_name . "\t" .
          $title . "\t" .
          $constituency . "\t" . 
          $branch . "\t" . 
          $ward . "\t" . 
          $gender . "\t" .
          $member . "\n" if (grep /@/, $email);
}
close $infile;
