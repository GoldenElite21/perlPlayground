#!/site/perl/bin/perl

use strict;
use warnings;

my $string = shift(@ARGV);
my $test = shift(@ARGV);

print "The string \"" . $string . "\" " . ( ($string =~ /$test/) ? "contains" : "does not contain" ) . " the word \"" . $test . "\".\n";

