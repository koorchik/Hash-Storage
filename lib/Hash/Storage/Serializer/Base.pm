package Hash::Storage::Serializer::Base;

use strict;
use warnings;
use Carp qw/croak/;

sub new {
    my $class = shift;
    my %args  = @_;
    return bless \%args, $class;
}

sub serialize {
    my ( $self, $data_structure ) = @_;
    my $class = ref $self || $self;
    croak "Method [serialize] is not implemented in class [$class]";
}

sub deserialize {
    my ( $self, $serialized ) = @_;
    my $class = ref $self || $self;
    croak "Method [deserialize] is not implemented in class [$class]";
}

1;
