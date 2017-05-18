package Coin;
use warnings;
use strict;

sub new {
   my $class = shift;
   my $self = {
      side => 0
   };
   bless $self, $class;
   $self->flip();
   return $self;
}

sub flip {
   my $self = shift; 
   $self->{side} = int(rand(2));
   return $self;
}

sub set {
   my $self = shift; 
   my $new_side = shift;
   if ( $new_side == 0 || $new_side == 1 ) {
     $self->{side} = $new_side;
   }
   return $self;
}

sub get {
   my $self = shift; 
   return $self->{side};
}

sub toString {
   my $self = shift; 
   my $output = "Head";
   $output = "Tail" if ( $self->{side} == 0 );
   return $output;
}

1;
