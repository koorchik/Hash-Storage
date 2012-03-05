use strict;
use warnings;
use lib '../lib';
use Hash::Storage;
use Data::Dumper;
use Data::Serializer::Raw;
use utf8;

my $st = Hash::Storage->new( driver => [ OneFile => { 
    serializer => Data::Serializer::Raw->new(serializer => 'JSON'), 
    file => '/tmp/t.json' 
} ] );

$st->set( 'user1' => { name => 'Viktor', gender => 'M', age => '28' } );
$st->set( 'user2' => { name => 'Антон',  gender => 'M', age => '28' } );

print Dumper( $st->get('user1') );
print Dumper( $st->get('user2') );

print Dumper( $st->list() );