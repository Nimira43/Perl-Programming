# Perl Deck Program Explained

This file explains a simple `Deck` class in Perl, modeled after the Ruby version.  
Each section of code is followed by a short explanation.

---

```perl
#!/usr/bin/perl
```

Shebang line: tells the system to run this script with Perl.

```perl
use strict;
use warnings;
```

strict: forces you to declare variables properly (my), preventing sloppy mistakes.
warnings: gives helpful runtime messages about potential issues.

```perl
package Deck;
```

Declares a package (namespace).
In Perl, packages act like classes. Methods defined here belong to Deck.

```perl
sub new {
    my ($class) = @_;
    my $self = { cards => [] };
```

sub defines a subroutine (function).
new is the constructor.
@_ holds arguments
\$class gets the first one (usually "Deck").
\$self is a hash reference holding object data (cards array).

```perl
    my @suits  = ("Spades", "Diamonds", "Hearts", "Clubs");
    my @values = ("Ace", "Two", "Three", "Four", "Five", "Six", "Seven",
                  "Eight", "Nine", "Ten", "Jack", "Queen", "King");
```

Arrays of suits and values, just like in Ruby.

```perl
    for my $suit (@suits) {
        for my $value (@values) {
            push @{ $self->{cards} }, "$value of $suit";
        }
    }
```

Nested loops build the full deck.
push adds each card string into the cards array inside $self.

```perl
    bless $self, $class;
    return $self;
}
```

bless: turns \$self into an object of class $class.
Returns the new Deck object.

```perl
sub print {
    my ($self) = @_;
    for my $i (0 .. $#{ $self->{cards} }) {
        print "$i: $self->{cards}->[$i]\n";
    }
}
```

Prints each card with its index.
\$#{ $self->{cards} } gives the last index of the array.

```perl
sub deal {
    my ($self, $hand_size) = @_;
    my @hand = splice @{ $self->{cards} }, 0, $hand_size;
    return (\@hand, $self->{cards});
}
```

splice removes the first $hand_size cards from the deck.
Returns both the hand and the remaining deck.

```perl
sub to_string {
    my ($self) = @_;
    return join(",", @{ $self->{cards} });
}
```

Joins all cards into a single comma-separated string.

```perl
sub save_to_file {
    my ($self, $filename) = @_;
    open my $fh, ">", $filename or die "Cannot open $filename: $!";
    print $fh $self->to_string;
    close $fh;
}
```

Opens a file for writing.
Saves the deck as a string.
die stops the program if the file can’t be opened.

```perl
sub load_from_file {
    my ($class, $filename) = @_;
    open my $fh, "<", $filename or die "Cannot open $filename: $!";
    my $content = <$fh>;
    close $fh;
    my @cards = split /,/, $content;
    return $class->new_from_cards(\@cards);
}
```

Reads deck data from a file.
Splits the string back into an array of cards.
Calls new_from_cards to rebuild the object.

```perl
sub new_from_cards {
    my ($class, $cards_ref) = @_;
    my $self = { cards => $cards_ref };
    bless $self, $class;
    return $self;
}
```

Creates a new deck object from an existing list of cards.

```perl
sub shuffle {
    my ($self) = @_;
    my @shuffled = sort { rand() <=> rand() } @{ $self->{cards} };
    $self->{cards} = \@shuffled;
}
```

Shuffles the deck.
Uses a random sort trick (for real projects, List::Util::shuffle is better).

```perl
1;
```

Required at the end of a package.
Returns a true value so Perl knows the package loaded correctly.

```perl
package main;

my $deck = Deck->new();
$deck->shuffle();
$deck->print();
```

Switches back to the main program.
Creates a new deck, shuffles it, and prints the cards.
