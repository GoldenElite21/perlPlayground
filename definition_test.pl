#!/site/perl/bin/perl -l

use strict;
use warnings;

##https://stackoverflow.com/questions/1480066/in-perl-how-can-i-concisely-check-if-a-variable-is-defined-and-contains-a-non

##------------------Lengthened-----------------

my @Aarray;

my $Astring = (defined $Aarray[0]  && $Aarray[0]  ne '') ? $Aarray[0] : '';
print 'A. undefined: ' . $Astring unless defined $Aarray[0];

$Aarray[0] = '';
$Astring = (defined $Aarray[0]  && $Aarray[0]  ne '') ? $Aarray[0] : '';
print 'A. empty: ' . $Astring if defined $Aarray[0];

$Aarray[0] = 'test';
$Astring = (defined $Aarray[0]  && $Aarray[0]  ne '') ? $Aarray[0] : '';
print 'A. defined: ' . $Astring;

print "\n";
##------------------Shortened------------------

my @Barray;

my $Bstring = (defined $Barray[0]) ? $Barray[0] : '';
print 'B. undefined: ' . $Bstring unless defined $Barray[0];

$Barray[0] = '';
$Bstring = (defined $Barray[0]) ? $Barray[0] : '';
print 'B. empty: ' . $Bstring if defined $Barray[0];

$Barray[0] = 'test';
$Bstring = (defined $Barray[0]) ? $Barray[0] : '';
print 'B. defined: ' . $Bstring;

print "\n";
##------------------Binary------------------

my @Carray;

my $Cstring = ($Carray[0] // '');
print 'C. undefined: ' . $Cstring unless defined $Carray[0];

$Carray[0] = '';
$Cstring = ($Carray[0] // '');
print 'C. empty: ' . $Cstring if defined $Carray[0];

$Carray[0] = 'test';
$Cstring = ($Carray[0] // '');
print 'C. defined: ' . $Cstring;

print "\n";

#-------------------regex example
my $area;
my $category = '18.AAA.BBB1234CC55.banan';

## Matching like: 18.AAA.BBB1234CC55.banan
($area) = ($category =~ /.*[0-9]{2}\..*\.([^0-9]+).*\.[^>]*.*/);


print $area;
print $category;
