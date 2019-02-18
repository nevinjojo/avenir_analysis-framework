#!/usr/bin/perl -w
######################################################################
# SQL report graphing modules of the Perl data analysis framework
#
## tab==4 spaces
##
## Author: Nevin Jojo
#######################################################################

use strict;
use warnings;
use IO::Handle;

use 5.010;

use Avenir::Common::OBJ::DB;
use Avenir::Common::Syslog qw(:all);

use Log::Log4perl qw(:easy);
Log::Log4perl->easy_init(
    {
        file  => ">> logs/error_logs.txt",
        level => $WARN,
    },
    {
         file  => ">> logs/info_logs.txt",
         level => $INFO,
     }
);

######################################################################
# Variables
######################################################################



######################################################################
# Processes
######################################################################

##
# write logs from framework to a file
##
sub logs
{
    my $time = $main::timestamp;
        
    ## Todo: Add more details about the log as the framework expands
    my $stamp = "$time\n\n";
    
    open(STDOUT, '>', "logs/outputlog.txt") or die "Can't log STDOUT: $!";
    print STDOUT "$stamp";
    open(STDERR, '>', "logs/errorlog.txt") or die "Can't log STDERR: $!";
    print STDERR "$stamp";
}

1;
