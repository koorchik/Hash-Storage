package Hash::Storage::AutoTester;

use strict;
use warnings;
use v5.10;

use Test::More;
use Test::Deep;

sub new {
    my $class = shift;
    my %args  = @_;

    my $st = $args{storage};
    die "WRONG STORAGE" unless $st && $st->isa('Hash::Storage');

    return bless { storage => $st }, $class;
}

sub run {
    my $self = shift;
    $self->test_get();
    $self->test_set();
    $self->test_del();
}

sub test_get {
    my $self = shift;
    my $st = $self->{storage};

    my %user1 = (
        fname  => 'Ivan',
        lname  => 'Ivanov',
        age    => '21',
        gender => 'male'
    );

    my %user2 = (
        fname  => 'Taras',
        lname  => 'Schevchenko',
        age    => '64',
        gender => 'male'
    );

    subtest 'Getting set users' => sub {
        ok( $st->set('user1', {%user1}), 'should return true on successful "set"' );
        ok( $st->set('user2', {%user2}), 'should return true on successful "set"' );

        cmp_deeply($st->get('user1'), {%user1}, 'should return all1 user attrs');
        cmp_deeply($st->get('user2'), {%user2}, 'should return all1 user attrs');
    };
}


sub test_set {
    my $self = shift;
    my $st = $self->{storage};

    my %user = (
        fname  => 'Ivan',
        lname  => 'Ivanov',
        age    => '21',
        gender => 'male'
    );


    subtest 'Set and Update user' => sub {
        ok( $st->set('user', {%user}), 'should return true on successful "set"' );
        cmp_deeply($st->get('user'), {%user}, 'should return all user attrs');

        ok( $st->set('user', {lname => 'NewLname', age => 33}), 'should return true on successful "set"' );
        my $updated_user = $st->get('user');

        is( $updated_user->{fname},  'Ivan',     'fname should be the same as before');
        is( $updated_user->{lname},  'NewLname', 'lname should contain new value - "NewLname"');
        is( $updated_user->{age},    '33',       'age should contain new value - "33"');
        is( $updated_user->{gender}, 'male',     'gender should be the same as before');
    };
}

sub test_del {
    my $self = shift;
    my $st = $self->{storage};

    my %user1 = (
        fname  => 'Ivan',
        lname  => 'Ivanov',
        age    => '21',
        gender => 'male'
    );

    my %user2 = (
        fname  => 'Taras',
        lname  => 'Schevchenko',
        age    => '64',
        gender => 'male'
    );

    subtest 'Deleting users' => sub {
        ok( $st->set('user1', {%user1}), 'should return true on successful "set"' );
        ok( $st->set('user2', {%user2}), 'should return true on successful "set"' );

        cmp_deeply($st->get('user1'), {%user1}, 'should return all user attrs');
        cmp_deeply($st->get('user2'), {%user2}, 'should return all user attrs');
    };
}

1;
