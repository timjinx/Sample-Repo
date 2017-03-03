#!/usr/bin/perl
# exit codes
# 0 - success
# 1 - server not pingable
# 2 - insufficient servers configured
# 3 - nslookup failed
use Net::Ping;
use strict;
use Getopt::Std;

our ($opt_v, $opt_f, $opt_h);

my $resolve_conf = "/etc/resolv.conf";
my $test_server = "brm-hosting.us.oracle.com";
my $test_ip = "10.236.32.19";
my $timeout = 10;
my $errorflag = 0;
my $dnscount = 0;
my $dnsmini = 3; # report an error if fewer than this configured
my @nslookup_output;
my $success = 0;

$opt_v = 0;
$opt_h = 0;

getopt("f");

if ( $opt_h == 1 ) {
   print "Usage:\n";
   print "$0 [ Options ]\n";
   print "-f <file name> - override /etc/resolv.conf\n";
   print "-v - verbose mode\n";
   print "-h - show help text\n";
   print "exit codes\n";
   print "0 - success\n";
   print "1 - DNS server not pingable\n";
   print "2 - insufficient DNS servers configured\n";
   print "3 - nslookup failed\n";
   exit 0;
}

if ( defined $opt_f ) {
   $resolve_conf = $opt_f;
}
if ( -f $resolve_conf ) {
   print "Using $resolve_conf\n" if ($opt_v == 1);
} else {
   print "ERROR: $resolve_conf - file not found\n";
}

print "Reading " . $resolve_conf . "\n" if ($opt_v == 1);

die "Unable to open resolv.conf\n" unless (open( my $resolve_file, "<", $resolve_conf));
while (<$resolve_file>) {
    next unless ( grep /nameserver/, $_ );
    chomp;
    my @fields = split ' ', $_;
    # Pingable
    if ( pingecho($fields[1], $timeout)) {
        print $fields[1] . " is alive\n" if ($opt_v == 1);
    } else {
        print "ERROR: $fields[1] is not pingable\n";
        $errorflag = 1;
        next;
    }
    # Try to do an nslookup of a known server and check for its IP address
    print "Trying $fields[1]\n" if ($opt_v == 1);
    $success = 0;
    @nslookup_output = qx(/usr/bin/nslookup  $test_server $fields[1]);
    while (<@nslookup_output>) {
        next unless ( grep /$test_ip/, $_);
        $success = 1;
        $dnscount++;
    }
    if ( $success == 1 ) {
        print "SUCCESS: Used $fields[1] to get the IP address of  $test_server\n" if ($opt_v == 1);
    } else {
        print "ERROR: Failed to obtain the IP address of $test_server using $fields[1]\n";
        $errorflag = 3;
    }
}

close $resolve_file;

if ( $dnscount == 0 ) {
    print "ERROR: No usable dns servers configured\n";
    $errorflag = 2;
} elsif ( $dnscount < $dnsmini ) {
    if ( $dnscount == 1 ) { print "ERROR: Only " . $dnscount . " usable dns server configured\n"; }
    else { print "ERROR: Only " . $dnscount . " usable dns servers configured\n"; }
    $errorflag = 2;
}

print "Please check resolv.conf\n" if $errorflag > 0;
exit  $errorflag;
