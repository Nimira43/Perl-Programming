use strict;
use warnings;

# Arrays
my @new_array = (2, 5, 6, 7, "twelve");
print @new_array, "\n";

$new_array[2] = "Twenty";
print @new_array, "\n";

my $val01 = $new_array[2];
print $val01, "\n";

push @new_array, (27);
print @new_array, "\n";

my $val02 = $new_array[-1];
print $val02, "\n";

my $val03 = $new_array[3..5];
print $val03, "\n";
