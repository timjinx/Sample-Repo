#!/usr/bin/perl
use strict;
use warnings;

# Usage: perl split_mysql_dump.pl input_dump.sql

my $input_file = shift @ARGV;
die "Usage: $0 input_dump.sql\n" unless defined $input_file;

# Define the pattern to identify each table section
my $pattern = qr/-- Table structure for table `([^`]+)`.*/s;

open my $in_fh, '<', $input_file or die "Error opening $input_file: $!\n";
my ($table_name, $output_file);

while (my $line = <$in_fh>) {
    chomp $line;

    if ($line =~ $pattern) {
        $table_name = $1;
        $output_file = "$table_name.sql";
        print "Processing $output_file\n";

        open my $out_fh, '>', $output_file or die "Error creating $output_file: $!\n";
        print $out_fh "$line\n";  # Write the matched section (structure + data) to the output file
    }
    elsif ($table_name) {
        # Write subsequent lines to the same output file
        open my $out_fh, '>>', $output_file or die "Error opening $output_file: $!\n";
        print $out_fh "$line\n";
    }
}

close $in_fh;
close $out_fh;
print "MySQL dump split into separate files for each table.\n";

