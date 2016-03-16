package Clist ;
use Coin;
sub new
{
   my $class = shift;
   my $size = shift;
   my $self = {};
   bless ( $self, $class );
   $self->{size} = $size;
   my @coins = undef;
   for (my $i=0; $i < $self->{size}; $i++) {
      $coins{$i} = Coin->new(10);
	  # print $coins{$i}->print_face(),"\n";
   }
   $self->{coins} = @coins;
   return $self;
}

sub print_all
{
   my $self = shift;
   my $output = undef;
   my @coins = $self->{coins};
   for (my $i=0; $i < $self->{size}; $i++) {
      $output = $output . $coins{$i}->print_face() . "\n";
   }
   return $output;
}

sub flip_all
{
   my $self = shift;
   my $output = undef;
   my @coins = $self->{coins};
   for (my $i=0; $i < $self->{size}; $i++) {
      $coins{$i}->flip();
   }
   $self->{coins} = @coins;
}
sub count_heads
{
   my $self = shift;
   my $output = undef;
   my @coins = $self->{coins};
   my $head_count=0;
   for (my $i=0; $i < $self->{size}; $i++) {
      if ( $coins{$i}->getValue == 1 ) { 
	     $head_count++
	  };
   }
   return $head_count;
}
   
1;