package Hash::Storage;

use v5.10;
use strict;
use warnings;

our $VERSION = '0.01';


sub new {
    my ($class, $schema) = @_;
}

sub init {
    my ($self) = @_;
}

sub add {
    my ($self, $fields) = @_;
    
}

sub get {
    my ($self, $id) = @_;
}

sub set {
    my ($self, $id, $fields) = @_;
    
}

sub del {
    my ($self, $id) = @_;
} 


sub list {
    my ($self, $filter, $offset, $limit) = @_;
}

sub find {
    my ($self, $filter) = @_;
}

sub count {
    my ($self, $filter) = @_;
    
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
