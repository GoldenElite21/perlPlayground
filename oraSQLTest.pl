#!/site/perl/bin/perl -l

use strict;
use warnings;
use Date::Parse;
use Date::Format;

my $input = '04/24/1990';

  $input //= '';

  my $sql = "select snip from snip"; #base SQL statement

  if ($input ne ''){
    $input =~ s/[^a-zA-Z ]//g if($input =~ /^(?=.*[a-zA-Z])(?=.*[0-9])/); #Remove numbers if there are also letters
    $input =~ s/-/\//g; #- is invalid, but needs to work for the date anyway
    $input =~ s/[^a-zA-Z0-9 \/]|^\s+|\s+$//g; #Remove special characters and leading/trailing whitespace

    $sql .= " where "; #limit results
    if ($input =~ /[0-9]$/){ #If digits /^\d+?$/
      $input =~ s/ //g; #remove spaces for digit only inputs
      if($input =~ /\//){ #if slash for date
        if ($input =~ /^\d{1,2}\/\d{1,2}\/\d{2,4}$/){ #if correct format
          $sql .= "MYTABLE_BIRTH_DATE like '" . time2str("%m/%d/%Y", str2time($input)) . "'";
        } else {
          return [{Error => "Input: '" . $input . "' doesn't match date formatting.\n Dates require at least two '/'s or two '-'s\nEx: '1-1-17' or '01/01/2017'",}]; #return a hash in an array to match layout
        }
      } else {
        $sql .= "MYTABLE_CID like '%" . $input . "%'";
      }
    } elsif($input =~ /^[a-zA-Z\s]*$/ and $input =~ / / and (split / /, $input)[0] ne "" and (split / /, $input)[1] ne ""){ #If splittable (space)
      my @inputs = split / /, $input; #split up the inputs
      $sql .= "UPPER(MYTABLE_FIRST_NAME) like UPPER('" . $inputs[0] . "%') and UPPER(MYTABLE_LAST_NAME) like UPPER('" . $inputs[1] . "%')";
    } else { #Else just letters
      $sql .= "UPPER(MYTABLE_FIRST_NAME) like UPPER('" . $input . "%') or UPPER(MYTABLE_LAST_NAME) like UPPER('" . $input . "%')";
    }
  }

print $sql . "\n";

