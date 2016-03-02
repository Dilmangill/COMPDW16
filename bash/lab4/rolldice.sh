#!/bin/bash
# this script gets 2 numbers from the user
# a count of dice and a count of sides per die
# it prints out the results of rolling those dice
# Variables
###########
# the number of dice will be kept in $count, defaulting to 2
# the number of sides to a die will be kept in $sides, defaulting to 6
# start the total rolled at zero
sum=0
# Main
######
# Process the command line, checking for count and sides
while [ $# -gt 0 ]; do
case "$1" in
-c )
if [[ "$2" =~ ^[1-5]$ ]]; then
count=$2
else
echo "I wanted a number after the -c, from 1 to 5. CYA Bozo!"
exit 2
fi
;;
-s )
if [[ "$2" =~ ^[1-9][0-9]*$ ]]; then
if [ "$2" -ge 4 -a "$2" -le 20 ]; then
sides=$2
else
echo "I wanted a number after the -s, from 4 to 20. CYA Bozo!"
exit 2
fi
fi
;;
esac
shift
done
if [ -z "$count" ]; then
# ask the user how many dice they want to roll
read -p "How many dice[1-5, default is 2]? " numdice
# use what they gave us if it is a number from 1-5
if [[ "$numdice" =~ ^[1-5]$ ]]; then
count=$numdice
else
count=2
echo "Using a default of 2 since you aren't very helpful."
fi
fi
if [ -z "$sides" ]; then
# ask the user how many sides these dice have
read -p "How many sides[4-20, default is 6]? " numsides
# use what they gave us if it is a number from 4-20
if [[ "$numsides" =~ ^[1-9][0-9]*$ ]]; then
if [ $numsides -ge 4 -a $numsides -le 20 ]; then
sides=$numsides
else
sides=6
echo "Using 6-sided dice, since you are being difficult"
fi
else
sides=6
echo "Using 6-sided dice, since you are being difficult"
fi
fi
# loop through the dice, rolling them and summing the rolls
while [ $count -gt 0 ]; do
# the roll range is based on the number of sides
roll=$(( $RANDOM % $sides +1 ))
# add the current roll total to the running total
sum=$(( $sum + $roll ))
# give the user feedback about the current roll
echo "Rolled $roll"
# the loop will end when the count of dice to roll reaches zero
((count--))
done
# done rolling, display the sum of the rolls
echo "You rolled a total of $sum"
