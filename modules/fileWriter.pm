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

   
    # sanity check / backup report file declaration
    if (not defined $filename) {
        $filename = basename($_[1]);
        $filename =~ s/sql/txt/ig;
    }
    
    say "Output: reports/$filename";

    eval {
        # open report file and write $sth content to file
        open(my $fh, ">reports/$filename");
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
        warn("Could not open file '/reports/$filename'!");
    };
}

# File module must return a true value; hence, '1;'
1;
