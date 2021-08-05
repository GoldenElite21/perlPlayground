#!/site/perl/bin/perl

use strict;
use warnings;

my $ds1 =
{
    'h' => [5,6,7],
    'y' => { 't' => 'u', 'o' => 'p' },
    'hello' => 'up',
};

my $array_ref = [5, 6, 7, 10, 24, 90, 14];
my $x = "Hello World!";
my $y = \$x;

print "\$array_ref:\n";

print join(", ", @{$array_ref}), "\n";


print "\n\n\$ds1->{'h'}:\n";

print join(", ", @{$ds1->{'h'}}), "\n";

my %hash = %{$ds1->{'y'}};

print "\n\n\%hash:\n";

my $count = 0;
foreach my $k (keys(%hash))
{
	$count++;
    print " ", $count, ": ", $k,  " => ", $hash{$k};
}


print "\n\n\$\$y:\n";


#NOTE: the {} didn't make a difference below....
#NOTE: () don't work in place of squigly brackets...
print ${$y}, "\n";
print $$y, "\n";
