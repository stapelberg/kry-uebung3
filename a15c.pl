#!/usr/bin/env perl
# vim:ts=4:sw=4:expandtab
# Koinzidenzindex

use strict;
use warnings;
use Data::Dumper;
use List::Util qw(sum);
use v5.10;

my $chiffre = lc(shift);
say qq|Koinzidenzindex bestimmen von Chiffretext "$chiffre"|;

# Häufigkeit analysieren
my %counts = map { ($_, 0) } ('a' .. 'z');
for my $char (split //, $chiffre) {
    next unless exists($counts{$char});
    $counts{$char}++;
}

my $m = sum values %counts;
my $ci = (sum map { $_ * ($_ - 1) } values %counts) / ($m * ($m-1));
#say "nom = " . (sum map { $_ * ($_ - 1) } values %counts);
#say "denom = " . ($m * ($m-1));
say "Koinzidenzindex: $ci";
