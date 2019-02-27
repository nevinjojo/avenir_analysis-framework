#!/usr/bin/perl -w
######################################################################
# SQL file reader of the Perl data analysis framework
#
## tab==4 spaces
##
## Author: Nevin Jojo
#######################################################################

use strict;
use warnings;

use 5.010;

use Avenir::Common::OBJ::DB;
use Avenir::Common::Syslog qw(:all);

use File::Basename;
use POSIX qw(strftime);

#######################################################################
## Processes
#######################################################################

##
# write to a txt file
##
sub report_results
{
    my $sth = $_[0];
    my $filename = $main::dest;
    my $dir = strftime "%e-%b-%Y_%H.%M", localtime;
    
    # sanity check / backup report file declaration
    if (not defined $filename) {
        $filename = basename($_[1]);
        $filename =~ s/sql/csv/ig;
    }
    
    my $file_path = "reports/$dir/$filename";

    unless(-e "reports/$dir" or mkdir "reports/$dir") {
        print "Unable to create $dir.. Saving in reports/";
        $file_path = "reports/$filename";
    }
    
    say "Output: $file_path";
    
    eval {
        # open report file and write $sth content to file
        open(my $fh, ">$file_path");
        binmode($fh, ":utf8");
        
        eval {
            while(my @ref = $sth->fetchrow_array())
            {
                print $fh join(',',@ref),"\n";
            }
        } or do {
            my $error = $@;
        };
        close($fh);
    } or do {
        my $error = $@;
        warn("Could not open file '$file_path'!");
    };
}

# File module must return a true value; hence, '1;'
1;
