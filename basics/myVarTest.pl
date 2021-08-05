#!/site/perl/bin/perl

$x = 5;
$y = 1000;
print "Before the loop, \$y is ", $y, "\n";
{
    my ($y);
    for($y=0;$y<10;$y++){
        print "\$y = ", $y, "... ", $x, "*", $y, " = ", ($x*$y), "\n";
    }
}

print "Now, \$y is ", $y, "\n";
