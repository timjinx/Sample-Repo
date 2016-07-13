#!/usr/bin/perl
# exit codes
# 0 - success
# 1 - server not pingable
# 2 - insufficient servers configured
# 3 - nslookup failed
use Net::Ping;
use strict;
use Getopt::Std;
use Sys::Hostname;

our ($opt_v, $opt_f, $opt_h);

my $resolve_conf = "/etc/resolv.conf";
#my $resolve_conf = "./dodgy-resolv.conf";
my $test_server = "brm-hosting.us.oracle.com";
my $test_ip = "10.236.32.19";
my $timeout = 10;
my $errorflag = 0;
my $dnscount = 0;
my $dnsmini = 3; # report an error if fewer than this configured
my @nslookup_output;
my $success = 0;
my $dnsreport = "";
my $hostname = hostname();

if ( ! -f $resolve_conf ) {
   print "ERROR: $resolve_conf - file not found\n";
   exit -1;
}

my $ip_array = qx( host $hostname );
my @ip = split ' ', $ip_array;

die "Unable to open resolv.conf\n" unless (open( my $resolve_file, "<", $resolve_conf));
while (<$resolve_file>) {
    next unless ( grep /nameserver/, $_ );
    chomp;
    my @fields = split ' ', $_;
    # Pingable
    $dnsreport = $dnsreport . $fields[1];
    if ( ! pingecho($fields[1], $timeout)) {
        $dnsreport = $dnsreport . ":F:";
        $errorflag = 1;
        next;
    }
    # Try to do an nslookup of a known server and check for its IP address
    $success = 0;
    @nslookup_output = qx(/usr/bin/nslookup  $test_server $fields[1]);
    while (<@nslookup_output>) {
        next unless ( grep /$test_ip/, $_);
        $success = 1;
        $dnscount++;
    }
    if ( $success == 1 ) {
        $dnsreport = $dnsreport . ":P:";
    } else {
        $dnsreport = $dnsreport . ":F:";
        $errorflag = 3;
    }
}

close $resolve_file;

if ( $dnscount < $dnsmini ) {
    $errorflag = 2;
}

print $hostname . ":" . $ip[@ip - 1] . ":" . $dnscount . ":" . $dnsreport . "\n";
exit  $errorflag;
