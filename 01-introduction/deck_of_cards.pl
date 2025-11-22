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

sub deal {
  my ($self, $hand_size) = @_;
  my @hand = splice @{ $self->{cards} }, 0, $hand_size;
  return (\@hand, $self->{cards});
}

sub to_string {
  my ($self) = @_;
  return join(",", @{ $self->{cards} });
}

sub save_to_file {
  my ($self, $filename) = @_;
  open my $fh, ">", $filename or die "Cannot open $filename: $!";
  print $fh $self->to_string;
  close $fh;
}

sub load_from_file {
  my ($class, $filename) = @_;
  open my $fh, "<", $filename or die "Cannot open $filename: $!";
  my $content = <$fh>;
  close $fh;
  my @cards = split /,/, $content;
  return $class->new_from_cards(\@cards);
}

sub new_from_cards {
  my ($class, $cards_ref) = @_;
  my $self = {
    cards => $cards_ref,
  };
  bless $self, $class;
  return $self;
}