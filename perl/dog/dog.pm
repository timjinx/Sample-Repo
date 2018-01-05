package dog;
use warnings;
use strict;
sub new {
    my $class = shift;
    my $v_name = shift;
    my $v_breed = shift;
    my $v_age = shift;
    die unless $v_age =~ /^\d+$/;
    my $self = {
        name => $v_name,
        breed => $v_breed,
        age => $v_age
    };
    bless $self, $class;
    return $self;
}
sub info {
    my $self = shift;
    return $self->{name} . ", the " . $self->{age} . " year old " . $self->{breed};
}
sub birthday {
    my $self = shift;
    $self->{age}++;
    return;
}
sub greet {
    my $self = shift;
    my $message = shift;
    return $message . " " . $self->{name};
}
1;
