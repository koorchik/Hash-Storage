package Hash::Storage::Serializator::Base;

use strict;
use warnings;
use Carp qw/croak/;

sub new {
    my $class  = shift;
    my %args = @_;
    return bless \%args, $class; 
}

sub serialize {
    my ($self, $data_structure) = @_;
    my $class = ref $self || $self;  
    croak "Method [serialize] is not implemented in class [$class]"; 
}

sub unserialize {
    my ($self, $serialized) = @_;
    my $class = ref $self || $self;
    croak "Method [unserialize] is not implemented in class [$class]";
}

1;
