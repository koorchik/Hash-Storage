package Hash::Storage::Driver::Base;

use v5.10;
use strict;
use warnings;
use Carp qw/croak/;
use Data::Serializer::Raw;

our $VERSION = '0.01';

sub new {
    my $class = shift;
    my %args  = @_;
 
    my $serializer = $args{serializer};
    croak "Wrong serializer" unless $serializer;

    my $self = bless \%args, $class;

    if (! ref $serializer  ) {
        $self->{serializer} = Data::Serializer::Raw->new(serializer => $serializer);
    } elsif ( $serializer->can('serialize') && $serializer->can('deserialize') ) {
        $self->{serializer} = $serializer;
    } else {
        croak "Wrong serializer [$serializer]";
    }
    return $self;
}

sub init {
    my ($self) = @_;
    my $class = ref $self || $self;
    croak "Method [init] is not implemented in class [$class]";
}

sub get {
    my ( $self, $id ) = @_;
    my $class = ref $self || $self;
    croak "Method [get] is not implemented in class [$class]";
}

sub set {
    my ( $self, $id, $fields ) = @_;
    my $class = ref $self || $self;
    croak "Method [set] is not implemented in class [$class]";
}

sub del {
    my ( $self, $id ) = @_;
    my $class = ref $self || $self;
    croak "Method [del] is not implemented in class [$class]";
}

sub list {
    my ( $self, $filter, $offset, $limit ) = @_;
    my $class = ref $self || $self;
    croak "Method [list] is not implemented in class [$class]";
}

sub count {
    my ( $self, $filter ) = @_;
    my $class = ref $self || $self;
    croak "Method [count] is not implemented in class [$class]";
}

1;    # End of Hash::Storage