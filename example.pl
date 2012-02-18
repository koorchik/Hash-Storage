
use v5.10;
use strict;
use warnings;
use lib 'lib';

use Hash::Storage;
use Hash::Storage::Serializator::JSON;
use Hash::Storage::Driver::OneFile;

my $st = Hash::Storage->new(
    driver =>  Hash::Storage::Driver::OneFile->new(
        serializator => Hash::Storage::Serializator::JSON->new(),
        file         => '/tmp/t.json'
    )
);



use DDP;
$st->add({123 => 123});
p $st->get(2);
p $st->del(1);
