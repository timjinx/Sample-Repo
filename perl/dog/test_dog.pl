#!/usr/bin/perl
use warnings;
use strict;
use dog;
sub main {
    my $my_dog = dog->new("Lily", "Pit Mix", 8);
    print $my_dog . "\n";
    print $my_dog->info . "\n";
    $my_dog->birthday;
    print $my_dog->info . "\n";
    print $my_dog->greet("hello");
}
main();