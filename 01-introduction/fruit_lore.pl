use strict;
use warnings;

my @fruits = ("Apple", "Banana", "Orange", "Mangos", "Pears", "Peaches");

my %fruit_colours = (
    "Apple"   => "Red",
    "Banana"  => "Yellow",
    "Orange"  => "Orange",
    "Mangos"  => "Golden",
    "Pears"   => "Green",
    "Peaches" => "Blush"
);

my %fruit_roles = (
    "Apple"   => "Rich in pectin",
    "Banana"  => "High in resistant starch and pectin",
    "Orange"  => "Packed with vitamin C",
    "Mangos"  => "Loaded with vitamin A and beta-carotene",
    "Pears"   => "High in soluble fibre",
    "Peaches" => "Rich in vitamin C and antioxidants"
);

print " Fruit Lore Scroll\n";
print "-------------------\n";

foreach my $fruit (@fruits) {
    my $colour = $fruit_colours{$fruit} // "Unknown";
    my $role  = $fruit_roles{$fruit}  // "Unknown";

    printf("%-8s | Colour: %-7s | Role: %s\n", $fruit, $colour, $role);
}

=begin
Format Code	  Meaning	Example                                         Output
%-8s	        Left-align a string in a field 8 characters wide	      "Apple "
%-7s	        Left-align a string in a field 7 characters wide	      "Red "
%s	          Print string as-is (no padding)	                        "Rich in pectin"
=cut

print "\n Alphabetical Order:\n";
my @sorted_fruits = sort @fruits;
print join(" | ", @sorted_fruits) . "\n";
