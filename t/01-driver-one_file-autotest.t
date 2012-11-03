#!/usr/bin/perl

use Test::More;
use Hash::Storage::AutoTester;

BEGIN {
    use_ok( 'Hash::Storage' ) || print "Bail out!\n";
}

my $st = Hash::Storage->new( driver => [ OneFile => { file => '/tmp/t.json', serializer => 'JSON' } ] );

my $tester = Hash::Storage::AutoTester->new(storage => $st);
$tester->run();

done_testing;