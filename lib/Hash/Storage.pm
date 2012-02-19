package Hash::Storage;

use v5.10;
use strict;
use warnings;
use Carp qw/croak/;

our $VERSION = '0.01';

sub new {
    my $class  = shift;
    my %args   = @_;
    my $driver = $args{driver};
    croak "Wrong driver" unless ref $driver;

    my $self = bless {}, $class;

    if ( ref $driver eq 'ARRAY' ) {
        my $driver_class = 'Hash::Storage::Driver::' . $driver->[0];

        eval "require $driver_class";
        croak "Cannot load [$driver_class] $@" if $@;

        $self->{driver} = $driver_class->new( %{ $driver->[1] || {} } );
    } elsif ( $driver->isa('Hash::Storage::Driver::Base') ) {
        $self->{driver} = $driver;
    } else {
        croak "Wrong driver [$driver]";
    }

    $self->init();

    return $self;
}

sub init {
    my $self = shift;
    $self->{driver}->init(@_);
}

sub get {
    my ( $self, $id ) = @_;
    croak "id is required" unless $id;
    $self->{driver}->get($id);
}

sub set {
    my ( $self, $id, $fields ) = @_;
    croak "id is required" unless $id;
    croak "fields are required" unless ref $fields eq 'HASH';
    
    $self->{driver}->set( $id, $fields );
}

sub del {
    my ( $self, $id ) = @_;
    croak "id is required" unless $id;
    
    $self->{driver}->del($id);
}

sub list {
    my ( $self, $filter, $order, $offset, $limit ) = @_;
    $self->{driver}->list( $filter, $order, $offset, $limit );
}

sub count {
    my ( $self, $filter ) = @_;
    $self->{driver}->count($filter);
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
