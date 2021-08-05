#!/site/perl/bin/perl

use strict;
use warnings;

# Import the Data::Dumper class
use Data::Dumper;

# Define a sample data structure
my $data =
{
    "a" => [ 5, 100, 3 ],
    "hello" =>
    {
        "yes" => "no",
        "r" => "l",
    },
};

# Construct a Data::Dumper instance that is associated with this data
# "\$data" is just a name. it can be replaced with anything.
# The important part is that to the left of the name.
# $data is the hash we are referencing with the dump
my $dumper = Data::Dumper->new([ $data], [ "\$data" ]);

# Call its method that renders it into a string.
print $dumper->Dump();

