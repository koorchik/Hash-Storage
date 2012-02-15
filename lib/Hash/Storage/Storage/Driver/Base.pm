package Hash::Storage:::Driver::Base;

use v5.10;
use strict;
use warnings;
use Carp qw/croak/;

our $VERSION = '0.01';

sub new {
    my ($class) = @_;
    my %args = @_;
    
    # Check serializator    
    my $ser = $args{serializator};
    croak "Serializator required" unless $ser;
    croak "Serializator required" unless $ser;
    unless ( $ser->can('serialize')  && $ser->can('unserialize')) {
        croak "Serializator must have [serialize] and [unserialize] methods";
    }
   
    return bless \%args, $class; 
}

sub init {
    my ($self) = @_;
    my $class = ref $self || $self;
    croak "Method [init] is not implemented in class [$class]";
}

sub add {
    my ($self, $fields) = @_;
    my $class = ref $self || $self;
    croak "Method [add] is not implemented in class [$class]";
}

sub get {
    my ($self, $id) = @_;
    my $class = ref $self || $self;
    croak "Method [get] is not implemented in class [$class]";
}

sub set {
    my ($self, $id, $fields) = @_;
    my $class = ref $self || $self;
    croak "Method [set] is not implemented in class [$class]";
}

sub del {
    my ($self, $id) = @_;
    my $class = ref $self || $self;
    croak "Method [del] is not implemented in class [$class]";    
} 

sub list {
    my ($self, $filter, $offset, $limit) = @_;
    my $class = ref $self || $self;
    croak "Method [list] is not implemented in class [$class]";    
}

sub find {
    my ($self, $filter) = @_;
    my $class = ref $self || $self;
    croak "Method [find] is not implemented in class [$class]";    
}

sub count {
    my ($self, $filter) = @_;
    my $class = ref $self || $self;
    croak "Method [count] is not implemented in class [$class]";    
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

1; # End of Hash::Storage
