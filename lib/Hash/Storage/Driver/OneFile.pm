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
    my $data       = $self->{serializer}->unserialize($serialized);

    return $data;
}

sub _save_data {
    my ( $self, $data ) = @_;
    my $serialized = $self->{serializer}->serialize($data);
    write_file( $self->{file}, { atomic => 1 }, $serialized );
}

=head1 NAME

Hash::Storage - The great new Hash::Storage!

=cut

=head1 AUTHOR

"koorchik", C<< <"koorchik at cpan.org"> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-hash-storage at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Hash-Storage>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.




=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Hash::Storage


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker (report bugs here)

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Hash-Storage>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Hash-Storage>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Hash-Storage>

=item * Search CPAN

L<http://search.cpan.org/dist/Hash-Storage/>

=back


=head1 ACKNOWLEDGEMENTS


=head1 LICENSE AND COPYRIGHT

Copyright 2012 "koorchik".

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.


=cut

1;    # End of Hash::Storage
