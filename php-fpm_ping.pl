#!/usr/bin/perl
#
# Boris HUISGEN <bhuisgen@hbis.fr>

use LWP::UserAgent;

my $URL = "http://127.0.0.1/php5fpm-ping";

#
# DO NOT MODIFY AFTER THIS LINE
#

my $ua = LWP::UserAgent->new(timeout => 15);
my $response = $ua->request(HTTP::Request->new('GET', $URL));

if ($response->is_success) {
 print "1\n";
}
else {
 print "0\n";
}
