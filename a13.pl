#!/usr/bin/env perl
$_ = shift; $c{$1}++ while (s/((.)\2*)//);
print "Sequenz $_ kommt $c{$_} mal vor\n" for keys %c;
