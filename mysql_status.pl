#!/usr/bin/perl
#
# Boris HUISGEN <bhuisgen@hbis.fr>

my($mysql)   = "/usr/bin/mysql";
my($user)    = "zabbix";
my($passwd)  = "abcdef123";
my($host)    = "localhost";

#
# DO NOT MODIFY AFTER THIS LINE
#

=head1 NAME

mysql_status.pl - show MySQL variable status

=head1 SYNOPSIS

 mysql_status.pl VARIABLE

 --help                      print this help message
 --version                   print version information

=head1 DESCRIPTION

This program shows the status of a MySQL variable.

=head1 AUTHOR

Boris HUISGEN <bhuisgen@hbis.fr>

=cut

use strict;
use warnings;

use Getopt::Long qw(:config auto_help auto_version);
use Pod::Usage;

$main::VERSION = "0.1-2011051101";

exit main();

sub show_variable {
 my ($variable) = $_[0];

 my ($cmd) = "$mysql -u $user -p$passwd -h $host --execute \"SHOW STATUS LIKE '$variable'\" --skip-column-name";
 my ($ret) =`$cmd 2> /dev/null`;
 exit(1) unless($ret);

 $ret =~ m/^$variable.[\s\t]*(.*)/;
 print "$1\n";
}

sub main {
 GetOptions ()
 or pod2usage(1);

 pod2usage (1) unless ($#ARGV == 0);

 my ($variable) = $ARGV[0];

 show_variable($variable);
}

# end of script
