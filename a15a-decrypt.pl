#!/usr/bin/env perl
# vim:ts=4:sw=4:expandtab
# entschlüsselt vigenere

use strict;
use warnings;
use Data::Dumper;
use v5.10;

my $chiffre = lc(shift);
my $key = lc(shift);
say "entschlüssle $chiffre nach vigenere mit schlüssel $key";

# Wir invertieren den Schlüssel und machen dann ganz normal vigenere:
$key = join('', map { chr(220 - ord($_)) } split //, $key);
$key = $key x length($chiffre); # wasteful

my @alphabet = ('a' .. 'z');
my $i = 0;
my @encrypted;
for my $char (split //, $chiffre) {
    if ($char ~~ @alphabet) {
        my $z = ord($char) - ord('a');
        my $zs = ($z + (ord(substr($key, $i, 1)) - ord('a'))) % @alphabet;
        push @encrypted, chr($zs + ord('a'));
    } else {
        push @encrypted, $char;
    }
    $i++;
}
say "entschlüsselt: " . join('', @encrypted);
