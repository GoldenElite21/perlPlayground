#!/site/perl/bin/perl


use strict;
use warnings;

my (@primes, $i);

MAIN_LOOP: for(
    @primes=(2), $i=3 ;
    scalar(@primes) < 10 ;
    $i++
    )
{
    foreach my $p (@primes) {
        if ($i % $p == 0)
        {
            next MAIN_LOOP;
        }
    }

    push @primes, $i;
}

print join(", " , @primes), "\n";
