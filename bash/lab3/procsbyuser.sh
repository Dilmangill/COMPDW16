#!/bin/bash
# this script summarizes the number of processes
# by user and warns us if the user named
# nobody has processes running
# Variables
###########
# we will put the process counts into a hash keyed using the username
# Main
######
# use the ps command to generate a list of processes, displaying only the username that owns each process
# each output line from the ps command has just a username
# so use that to add 1 to the count of processes for that user
# rely on the fact that the first time you assign a value to a variable,
# it is treated like the variable had a zero in it
# loop through our hash of counts to display the results
# display the username and count for that user
# display the count specifically for the user "nobody" if they have a count in the hash
