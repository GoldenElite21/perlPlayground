#!/site/perl/bin/perl

#string must contain three characters between l and x
use strict;
use warnings;

my $string = lc(shift(@ARGV));

if ($string =~ /l...x/)
{
    print "True\n";
}
else
{
    print "False\n";
}
