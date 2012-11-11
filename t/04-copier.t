#!/usr/bin/perl

use Test::More;
use Test::Deep;
use Hash::Storage;

BEGIN {
    use_ok( 'Hash::Storage::Copier' ) || print "Bail out!\n";
}

my $src_storage = Hash::Storage->new( driver => [ Memory => { serializer => 'Dummy' } ] );
my $dst_storage = Hash::Storage->new( driver => [ Memory => { serializer => 'Dummy' } ] );

my %user1 = (
    fname  => 'Ivan',
    lname  => 'Ivanov',
    age    => '30',
    gender => 'male'
);

my %user2 = (
    fname  => 'Taras',
    lname  => 'Leleka',
    age    => '64',
    gender => 'male'
);

my %user3 = (
    fname  => 'Taras',
    lname  => 'Schevchenko',
    age    => '22',
    gender => 'male'
);

my %user4 = (
    fname  => 'Petrik',
    lname  => 'Pyatochkin',
    age    => '8',
    gender => 'male'
);

my %user5 = (
    fname  => 'Lesya',
    lname  => 'Ukrainka',
    age    => '30',
    gender => 'female'
);

$src_storage->set('user1', {%user1});
$user1{_id} = 'user1';

$src_storage->set('user2', {%user2});
$user2{_id} = 'user2';

$src_storage->set('user3', {%user3});
$user3{_id} = 'user3';

$src_storage->set('user4', {%user4});
$user4{_id} = 'user4';

$src_storage->set('user5', {%user5});
$user5{_id} = 'user5';


my $copier = new_ok('Hash::Storage::Copier', [src => $src_storage, dst => $dst_storage] );

is($dst_storage->count(), 0, 'DST storage should be empty');
cmp_deeply($dst_storage->list(), [], 'DST storage should be empty');

$copier->copy_all();

is($dst_storage->count(), 5, 'DST storage should contain all 5 users');
cmp_bag(
    $dst_storage->list(), 
    [\%user1, \%user2, \%user3, \%user4, \%user5,], 
    'DST storage should contain all 5 users'
);

done_testing;