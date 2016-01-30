#!/bin/bash
# this script gets 2 numbers from the user
# a count of dice and a count of sides per die
# it prints out the results of rolling those dice
# Variables
###########
# default of 2 dice
# default of 6 sides to a die
# start the total rolled at zero
# Main
######
# ask the user how many dice they want to roll
# use what they gave us if it is a number from 1-5
# ask the user how many sides these dice have
# use what they gave us if it is a number from 4-20
# loop through the dice, rolling them and summing the rolls
# the roll range is based on the number of sides
# add the current roll total to the running total
# give the user feedback about the current roll
# the loop will end when the count of dice to roll reaches zero
# done rolling, display the sum of the rolls
