package Cline;
use warnings;
use strict;
use Coin;
sub new {
   my $class = shift;
   my $no_of_coins = shift;
   my $self = {
      cline => []
   };
   bless $self, $class;
   for (my $i=0; $i < $no_of_coins; $i++) {
     push(@{$self->{cline}}, Coin->new());
   }
   return $self;
}

sub flipAll {
   my $self = shift;
   foreach my $c (@{$self->{cline}}) {
      $c->flip();
   }
   return $self;
}

sub countHeads {
   my $self = shift;
   my $ccount = 0;
   foreach my $c (@{$self->{cline}}) {
      $ccount++ if ( $c->get() );
   }
   return $ccount;
}

1;
