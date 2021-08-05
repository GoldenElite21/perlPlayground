#!/site/perl/bin/perl

use strict;
use warnings;

use Data::Dumper;
use Net::LDAPS;

## Turn off buffering.  The pipe is boolean ON(0) and OFF(1).
$|++;

## Bind connection to LDAP server.
my $ldaps = Net::LDAPS->new('ldaps://snip', onerror => 'die') or die "$@";
$ldaps->bind('snip',password => 'snip') or die "$@";

## Create LDAP query and execute it.
my $filter = '(cn=esmith21)';

print "Filter: " . $filter . "\n";

my $search_result = $ldaps->search(
  base => 'dc=angelo,dc=local'
  ,filter => $filter
  ,scope => 'sub'
  ,attrs => [
            'dn',
            'cn',
            'member',
            'sAMAccountName',
            'userPrincipalName',
            'givenname',
            'sn',
            'department',
            'displayname',
            'title',
            'name',
            'employeeNumber',
            'pwdLastSet',
            ]

  ) or die "$@";

my $result = $search_result->as_struct;

my %groups;

## Write the result data to screen using Dumper
print Dumper ($result);

$ldaps->unbind;
#die;
 
