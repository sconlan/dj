use strict;

#todo
# cl params
# multiple directories or playlist

my $shuffle="yes";
my $dir=$ARGV[0];

my $out=`find '$dir' -type f -iname '*.mp3' -or -iname '*.m4a' -not -path '*/.*'`;
my @mp3=split(/\n/,$out);
if (scalar(@mp3)==0){die "no files found\n"};

if ($shuffle eq "yes"){fisher_yates_shuffle( \@mp3 )};

my $n=0;
my $div="="x80;
print "$div\n$dir"."\n$div\n";

foreach my $m (@mp3)
  {
    $n++;
    my $disp=$m;
    $disp=~s/$dir//; #trim off directory
    my $inf=`afinfo --brief \"$m\"`;

    #grab time using afinfo
    my $time="--:--";
    if ($inf=~/(\n\d+\.*\d*)\ssec/)
      {
        my $dur=$1;
        my $min=int($dur/60);
        my $sec=sprintf("%02d", int($dur-($min*60)));
        $time=$min.":".$sec;
      }
    else {print "error parsing afinfo: ".$inf};
 
    print "\t".join("\t",$n."/".scalar(@mp3),$time, substr($disp,0,50))."\n";

    my $err=system("afplay \"$m\"");
    if ($err != 0)
    {
       if ($err == 2){print "\tskip\n"}
       else {print "\terror: $err\n"};
    }
    sleep(1);
  }

########
# SUB

sub fisher_yates_shuffle {
    my $array = shift;
    my $i;
    for ($i = @$array; --$i; ) {
        my $j = int rand ($i+1);
        next if $i == $j;
        @$array[$i,$j] = @$array[$j,$i];
    }
}
