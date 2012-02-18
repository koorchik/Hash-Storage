package Hash::Storage::Util;

use strict;
use warnings;
use v5.10;

use Carp qw/croak/;
use File::Spec;
use Fcntl qw/:flock/;
use Exporter;

our @ISA = ('Exporter');
our @EXPORT_OK  = ('do_exclusively');

sub do_exclusively {
    my $cb = shift;
    croak "Subroutine reference required"  unless ref($cb) eq 'CODE';

    state $semophore = File::Spec->tmpdir() . '/hash_storage.semaphore';
    open( my $fh, '>', $semophore ) or die "Cannot open semaphore [$semophore] $!";
    
    flock($fh, LOCK_EX) or die "Cannot lock  semaphore [$semophore] $!";
    $cb->();
    flock($fh, LOCK_UN) or die "Cannot unlock semaphore [$semophore] $!";
}


1;
