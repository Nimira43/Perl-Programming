#!/usr/bin/perl
use strict;
use warnings;

package Deck;

sub new {
  my ($class) = @_;
  my $self = {
    card => [],
  };

  my @suits = ("Spades", "Diamonds", "Hearts", "Clubs");
  my @values = ("Ace", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Jack", "Queen", "King");

  for my $suit (@suits) {
    for my $value (@values) {
      push @{ $self->{ cards } }, "$value of $suit";
    }
  }

  bless $self, $class;
  return $self;
}

sub print {
  my ($self) = @_;
  for my $i (0..$#{ $self->{cards} }) {
    print "$i: $self->{cards}->[$i]\n";
  }
}