package Hash::Storage::Driver::Memory;

use v5.10;
use strict;
use warnings;
use File::Slurp;
use Hash::Storage::Util qw/do_exclusively/;
use List::Util qw/max/;
use base "Hash::Storage::Driver::Base";

sub init {
    my ($self) = @_;
    $self->{data} = {};
}

sub get {
    my ( $self, $id ) = @_;
    my $hashes = $self->{data};

    return $hashes->{$id};
}

sub set {
    my ( $self, $id, $fields ) = @_;
    my $hashes = $self->{data};
    
    @{ $hashes->{$id} }{ keys %$fields } = values %$fields;
    $hashes->{$id}->{_id} = $id;
}

sub del {
    my ( $self, $id ) = @_;
    my $hashes = $self->{data};

    delete $hashes->{$id};
}

sub list {
    my ( $self, @query ) = @_;
    my $hashes = $self->{data};

    my @hashes = values %$hashes;
    return $self->do_filtering(\@hashes, \@query);
}

sub count {
    my ( $self, $filter ) = @_;
    my $hashes = $self->list(where => $filter);
    return scalar(@$hashes);
}

1;    # End of Hash::Storage
