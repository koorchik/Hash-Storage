#!perl -T

use Test::More tests => 1;

BEGIN {
    use_ok( 'Hash::Storage' ) || print "Bail out!\n";
}

diag( "Testing Hash::Storage $Hash::Storage::VERSION, Perl $], $^X" );
