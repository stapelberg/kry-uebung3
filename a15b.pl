#!/usr/bin/env perl
# vim:ts=4:sw=4:expandtab
# kasiski-test

use strict;
use warnings;
use Data::Dumper;
use v5.10;

my $chiffre = lc(shift);
say qq|Kisiski-Test auf Chiffretext "$chiffre"|;

# Häufigkeit analysieren
my %counts;
for (my $i = 0; $i < length($chiffre) - 3; $i++) {
    my $part = substr($chiffre, $i, 4);
    $counts{$part}++;
}

for my $part (keys %counts) {
    next if $counts{$part} == 1;
    $chiffre =~ /$part(.*)$part/;
    my $inbetween = $1;
    # We need to strip spaces because they are not encrypted.
    $inbetween =~ s/ //g;
    my $distance = length($inbetween) + 4;
    say "$distance ist wahrscheinlich ein Vielfaches der Schlüsselwortlänge.";
}
