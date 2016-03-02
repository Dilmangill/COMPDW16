#!/bin/bash
# This script demonstrates how to trap signals and handle them using functions
#### Variables
#### Functions
# The error-message function will send an error message to stderr
# Usage:
# error-message ["some text to print to stderr"]
#
# The usage function will display command syntax
#
# Normally traps catch signals and do something useful or necessary with them
# These functions are for use with traps for signals we want to catch
# Quit if we get SIGQUIT, but let the user know why we are exiting
# Squawk if we get SIGHUP
# If we get SIGINT, we reset the counter to where it started
# trap the signals we care about and use them to invoke the functions above
#### Main Program
# Process command line parameters
# display what is left in our count
# sleep until it is time for the next display
# end the script when the count reaches zero
