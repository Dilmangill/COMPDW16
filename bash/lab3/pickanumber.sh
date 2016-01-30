#!/bin/bash
# this script will ask the user for a random number
# between one and ten and will keep asking
# until they get it right
# Variables
###########
# we need a random number for them to guess between 1 and 10
# since our loop will be controlled by their guess,
# start with an incorrect guess
# Main
######
# we aren't done until the user guesses our number
# so keep asking in a loop until they get it right
# get a number from them
# ask them over and over if they didn't give us something that looks like it might be valid while [[ ! "$guess" =~ ^[1-9]0*$ ]]; do
# give them feedback about their guess if it was wrong
# loop ended, so they got it right, let them know
