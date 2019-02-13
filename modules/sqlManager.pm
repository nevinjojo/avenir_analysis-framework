#!/usr/bin/perl -w
######################################################################
# SQL file reader of the Perl data analysis framework
#
# tab==4 spaces
#
# Author: Nevin Jojo
######################################################################

use strict;
use warnings;

use 5.010;

use Avenir::Common::OBJ::DB;
use Avenir::Common::Syslog qw(:all);

use File::Basename;
use lib dirname (__FILE__) . "/modules";
use fileWriter;

######################################################################
# Processes
######################################################################

##
# read SQL files
#
sub read_sql
{
    my $db = $_[0];
    my $dbh = $db->dbh;

    my @sql_files = @{$_[1]};
                    
    foreach my $file (@sql_files)
    {
        #sanity check the sql file format
        if (index($file, ".sql") == -1) {
            next;
        }

        # execute sql file
        my $sth = &execute_sql($dbh, $file);

        # report the results / data from the reported handler object
        &report_results($sth, $file);
    }
}


##
# execute SQL queries
##
sub execute_sql
{
    my $dbh = $_[0];
    my $file = $_[1];
    say "Input : $file";
    my $content;

    # Open each file and store the content
    open(SQL, '<', $file) or open(SQL, "<scripts/$file") or warn("Can't open $file");
        local $/;
        $content = <SQL>;
    close(SQL);

    # prepare the sql statement and store it in the statement handler object
    my $sth;

    eval {
        $sth = $dbh->prepare($content) or warn("Can't prepare the sql statement");
    } or do {
        my $error = $@;
    };
                                           
    # execute the statement handler object
    eval {
        $sth->execute() or warn("Can't execute sql statements");
    } or do {
        my $error = $@;
    };

    return $sth;
}

# File module must return a true value; hence, '1;'
1;
