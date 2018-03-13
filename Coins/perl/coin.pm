package Coin;
use Math::Round;
sub new
{
   my $class = shift;
   my $val = shift;
   my $self = {};
   bless ( $self, $class);
   $self->{value} = $val;
   $self->flip();
   return $self;
}

sub flip
{
   my $self = shift;
   $self->{face} = round(rand(1));
}

sub value
{
   my $self = shift;
   return $self->{value};
}

sub setValue
{
   my $self = shift;
   my $face = shift;
   if (( $face == 0 ) || ( $face == 1 )) {
      $self->{face} = $face;
   }
}
   
sub getValue
{
   my $self = shift;
   return $self->{face};
}

sub print_face
{
   my $self = shift;
   if ( $self->{face} == 1 ) {
      return "Heads";
   } else {
      return "Tails";
   }
}

1;
