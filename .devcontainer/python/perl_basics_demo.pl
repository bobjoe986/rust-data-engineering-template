#!/usr/bin/env perl
use strict;
use warnings;

# Imports
use POSIX qw(strftime);
use List::Util qw(sum);

# Global variables
our $APP_NAME = "Perl Basics Demo";
our $counter  = 0;

sub increment_counter {
    $counter += 1;
    return $counter;
}

sub add {
    my ($a, $b) = @_;
    return $a + $b;
}

sub classify_number {
    my ($n) = @_;
    if ($n < 0) {
        return "negative";
    } elsif ($n == 0) {
        return "zero";
    } else {
        return "positive";
    }
}

sub loop_examples {
    my (@values) = @_;

    print "for-loop:\n";
    for my $v (@values) {
        print "  value=$v\n";
    }

    print "while-loop:\n";
    my $i = 0;
    while ($i < scalar @values) {
        print "  index=$i, value=$values[$i]\n";
        $i++;
    }
}

sub main {
    print "== $APP_NAME ==\n";
    print "timestamp: " . strftime("%Y-%m-%dT%H:%M:%S", localtime) . "\n";

    # Scalars
    my $integer_value = 42;
    my $float_value   = 3.14;
    my $string_value  = "hello";
    my $bool_value    = 1;     # Perl truthy
    my $undef_value   = undef; # Perl "None"-like value
    print "\nScalars:\n";
    print "$integer_value $float_value $string_value $bool_value ";
    print defined($undef_value) ? $undef_value : "undef";
    print "\n";

    # Arrays
    my @numbers = (1, 2, 3, 4, 5);
    my @mixed   = (1, "two", 3.0, 0);
    push @numbers, 6;
    print "\nArrays:\n";
    print "numbers: @numbers\n";
    print "mixed: @mixed\n";
    print "slice numbers[1..3]: @numbers[1..3]\n";

    # Hashes
    my %user = (
        id     => 1,
        name   => "Ada",
        active => 1,
    );
    $user{email} = "ada\@example.com";
    print "\nHashes:\n";
    print "user name: $user{name}\n";
    print "user email: $user{email}\n";

    # Operators
    my ($a, $b) = (10, 3);
    print "\nOperators:\n";
    print "arithmetic: ", ($a + $b), " ", ($a - $b), " ", ($a * $b), " ", ($a / $b), " ", ($a % $b), "\n";
    print "comparison: ", ($a > $b), " ", ($a == $b), " ", ($a != $b), "\n";
    print "logical: ", (($a > 5) && ($b < 5)), " ", (($a < 5) || ($b < 5)), " ", !($a == $b), "\n";
    my $has_three = grep { $_ == 3 } @numbers;
    print "membership: ", ($has_three ? 1 : 0), " ", (exists $user{name} ? 1 : 0), "\n";

    # Functions
    print "\nFunctions:\n";
    print "add(7, 8): ", add(7, 8), "\n";
    print "classify_number(-2): ", classify_number(-2), "\n";

    # Control flow
    print "\nControl flow:\n";
    for my $n (-1, 0, 1) {
        print "$n is ", classify_number($n), "\n";
    }
    loop_examples(10, 20, 30);

    # Imports usage
    print "\nImports:\n";
    print "sum(1,2,3,4): ", sum(1, 2, 3, 4), "\n";

    # Global variable usage
    print "\nGlobal variable:\n";
    print "counter: $counter\n";
    print "counter after increment: ", increment_counter(), "\n";
    print "counter after second increment: ", increment_counter(), "\n";
}

main();
