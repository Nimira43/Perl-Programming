#!/usr/bin/env perl

use strict;
use warnings;

my %age = ("Alice", 45, "Bob", 59, "Chloe", 23, "Dave", 32, "Emma", 38, "Frank", 63, "Gail", 54, "Harry", 55, "Isla", 73, "Jack", 18);

my $val01 = $age{"Bob"};
print $val01, "\n";
my $val02 = $age{"Isla"};
print $val02, "\n";



# Arrays: Use @array for the whole thing, $array[2] for a single element.
# Hashes: Use %hash for the whole map, $hash{"key"} for a single value.
#Scalars: Always start with $, whether it's a number, string, or a single element pulled from an array or hash.


