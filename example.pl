
use v5.10;
use strict;
use warnings;
use lib 'lib';

use Hash::Storage;

my $st = Hash::Storage->new( driver => [ OneFile => { serializer => 'JSON', file => '/tmp/t.json' } ] );

use DDP;

$st->set( 2, { 23 => 223, 231 => 223, 232 => 223 } );
p $st->get(2);
p $st->del(1);
