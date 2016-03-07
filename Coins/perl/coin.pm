package Coin;
use Math::Round;
sub new
{
   my $class = shift;
   my $denom = shift;
   my $self = {};
   bless ( $self, $class);
   $self->{denomination} = $denom;
   $self->flip();
   return $self;
}

sub flip
{
   my $self = shift;
   $self->{face} = round(rand(1));
}

sub denomination
{
   my $self = shift;
   return $self->{denomination};
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

sub toString
{
   my $self = shift;
   return "Denomination: ", $self->denomination(), "\nFace: ", $self->print_face(), "\n";
}

1;
