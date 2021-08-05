#!/site/perl/bin/perl


%hash1 = (
    "shlomi" => "fish",
    "orr" => "dunkelman",
    "guy" => "keren"
    );

foreach $key (keys(%hash1))
{
	print $key, "=", $hash1{$key},"\n";
}
print "\n\n";

%hash2 = (
    "george" => "washington",
    "jules" => "verne",
    "isaac" => "newton"
    );

%combined = (%hash1, %hash2);

foreach $key (keys(%combined))
{
    print $key, " = ", $combined{$key},"\n";
}
