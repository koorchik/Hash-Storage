package Hash::Storage::Serializator::Storable;

use strict;
use warnings;
use Carp qw/croak/;
use Storable qw/nfreeze thaw/;

sub serialize {
    my ($self, $data_structure) = @_;
    croak "You must pass a reference to data" unless ref $data_structure;
    return nfreeze($data_structure); 
}

sub unserialize {
    my ($self, $serialized) = @_;
    croak "You must pass a serialized string" if !$serialized || ref($serialized);
    return thaw($serialized);
}

1;
