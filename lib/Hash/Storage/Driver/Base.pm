package Hash::Storage::Driver::Base;

use v5.10;
use strict;
use warnings;
use Carp qw/croak/;

our $VERSION = '0.01';
use DDP;
sub new {
    my $class = shift;
    my %args  = @_;
 
    my $serializer = $args{serializer};
    croak "Wrong serializer" unless $serializer;

    my $self = bless \%args, $class;

    if (! ref $serializer  ) {
        my $serializer_class = 'Hash::Storage::Serializer::' . $serializer;

        eval "require $serializer_class";
        croak "Cannot load [$serializer_class] $@" if $@;

        $self->{serializer} = $serializer_class->new();
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