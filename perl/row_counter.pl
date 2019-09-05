use strict;
use warnings;
use Getopt::Std;
use DBI;

our $opt_s;
getopt('s:');
die "Please enter a schema name\n" unless (defined $opt_s);
my $schema = $opt_s;

my %tablerows;
# Connect to the database.
my $dbh = DBI->connect("DBI:mysql:database=ddddddd;host=192.168.80.2",
                       "uuuuuuu", "pppppp",
                      {'RaiseError' => 1});
my $v_select = "SELECT TABLE_NAME, TABLE_ROWS FROM information_schema.TABLES WHERE TABLE_SCHEMA = '" . $schema . "'";
my $sth = $dbh->prepare($v_select);
$sth->execute();
while (my $ref = $sth->fetchrow_hashref()) {
  $tablerows{$ref->{'TABLE_NAME'}}=$ref->{'TABLE_ROWS'};
}
$sth->finish();

my @tablerow = keys %tablerows;
for my $table (@tablerow) {
   print "The number of rows in '$table' is $tablerows{$table}\n";
}

# Disconnect from the database.
$dbh->disconnect();
