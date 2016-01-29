#!/bin/bash	

#this script will out a welcome massage in predefined format

# VARIABLES
myname="Dilman"
mytitle="ultimate commander"
hostname=`hostname`
weekday=$(date +%A)

# MAIN
######
echo "$ Welcome to planet $hostname, $mytitle $myname!"
echo "Today is $weekday"
