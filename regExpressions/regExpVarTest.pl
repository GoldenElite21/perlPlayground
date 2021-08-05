#!/site/perl/bin/perl

use strict;
use warnings;

my $local = "TR|PL|EX|TQ|TA|SN|BA|BS|DT|BH|GL";
my $pcode = qr/^\s*($local)\d\w?\s+\d[A-Z]{2}\s*$/;
my @vcheck = ("SN12 6QL","G3 7XR","GLZ 7PX"," OX11 0EY","NW1 1AD");

foreach my $tp (@vcheck) { $tp =~ $pcode and print "\"$1\" was matched in \"$tp\"\n"; }
