package Hash::Storage::Serializator::JSON;

use v5.10;
use strict;
use warnings;
use Carp qw/croak/;
use JSON qw/to_json decode_json/;

use base 'Hash::Storage::Serializator::Base';

sub serialize {
    my ($self, $data) = @_;
    croak "You must pass a reference to data" unless ref $data;
    return to_json( $data, { utf8 => 1, canonical => 1 } ); 
}

sub unserialize {
    my ($self, $serialized) = @_;
    croak "You must pass a serialized string" if !$serialized || ref($serialized);
    
    my $res = eval { decode_json( $serialized ) };
    die 'ERROR', "Cant unserialize string [$serialized]. ERROR=[$@]" if $@;
    
    return $res;
}

1;
