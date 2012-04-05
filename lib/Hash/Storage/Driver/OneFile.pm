package Hash::Storage::Driver::OneFile;

use v5.10;
use strict;
use warnings;
use File::Slurp;
use Hash::Storage::Util qw/do_exclusively/;
use List::Util qw/max/;
use base "Hash::Storage::Driver::Base";

sub init {
    my ($self) = @_;

}

sub get {
    my ( $self, $id ) = @_;
    my $hashes = $self->_load_data();
    return $hashes->{$id};
}

sub set {
    my ( $self, $id, $fields ) = @_;

    do_exclusively( sub {
        my $hashes = $self->_load_data();
        @{ $hashes->{$id} }{ keys %$fields } = values %$fields;
        $self->_save_data($hashes);
    } );
}

sub del {
    my ( $self, $id ) = @_;

    do_exclusively( sub {
        my $hashes = $self->_load_data();
        delete $hashes->{$id};
        $self->_save_data($hashes);
    } );
}

sub list {
    my ( $self, $filter, $offset, $limit ) = @_;
    my $hashes = $self->_load_data();
    my @hashes = values %$hashes;
    return \@hashes;
}

sub count {
    my ( $self, $filter ) = @_;
    my $hashes = $self->_load_data();
    return scalar( keys(%$hashes) );
}

sub _load_data {
    my $self = shift;
    return {} unless -e $self->{file};
    my $serialized = read_file( $self->{file} );
    my $data       = $self->{serializer}->deserialize($serialized);

    return $data;
}

sub _save_data {
    my ( $self, $data ) = @_;
    my $serialized = $self->{serializer}->serialize($data);
    write_file( $self->{file}, { atomic => 1 }, $serialized );
}

1;    # End of Hash::Storage
