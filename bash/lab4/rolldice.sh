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
#Help function
#this function is used to get help

help_function() {
	cat <<-EOF
		This will roll a dice
		To get a value
		And will sum up all values

		Optional Arguments
		-c for a count of dice, will be between 1-5
		-s for a number of sides of a dice , will be between 4-20

		Example:
	./filename -d 4 # it will specify the number of dices which will be 4
	./filename -s 5 # number of sides will be 5
EOF
}
while [ $# -gt 0 ]; do
	case "$1" in
	-h | --help ) #help function execute
	help_function
	exit 0
	;;
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
*)
	echo "type -h or --help toget help"
		;;
	esac
	shift
done
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
