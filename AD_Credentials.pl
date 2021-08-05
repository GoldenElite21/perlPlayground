#!/site/perl/bin/perl

use strict;
use warnings;

use Data::Dumper;
use Net::LDAPS;

## Turn off buffering.  The pipe is boolean ON(0) and OFF(1).
$|++;

my $dc = 'ldaps://a.b.c';
my $dn = 'CN=e,OU=d,OU=c,DC=a,DC=b';
my $pw;

## Bind connection to LDAP server.
my $ldaps = Net::LDAPS->new($dc);# or die "$@";
my $mesg = $ldaps->bind($dn,password=> $pw) or die "test";
print +($mesg->{'errorMessage'} ? "Bad credentials" : "Success!");

$ldaps->unbind;
#die;
 
