#!/usr/bin/env perl
# vim:ts=4:sw=4:expandtab
# verschlüsselt vigenere

use strict;
use warnings;
use Data::Dumper;
use v5.10;

my $clear = lc(shift);
my $key = lc(shift);
say "verschlüssle $clear nach vigenere mit schlüssel $key";
$key = $key x length($clear); # wasteful

my @alphabet = ('a' .. 'z');
my $i = 0;
my @encrypted;
for my $char (split //, $clear) {
    if ($char ~~ @alphabet) {
        my $z = ord($char) - ord('a');
        my $zs = ($z + (ord(substr($key, $i, 1)) - ord('a'))) % @alphabet;
        push @encrypted, chr($zs + ord('a'));
    } else {
        push @encrypted, $char;
    }
    $i++;
}
say "verschlüsselt: " . join('', @encrypted);
