#!/usr/bin/perl
use warnings;
use strict;
use dog;
sub main {
    my $my_dog = dog->new("Lily", "Pit Mix", 8);
    print $my_dog . "\n";
    print $my_dog->info . "\n";
    print $my_dog->birthday . "\n";
    print $my_dog->info . "\n";
    print $my_dog->greet("hello") . "\n";
    print $my_dog->bark . "\n";
}
main();
