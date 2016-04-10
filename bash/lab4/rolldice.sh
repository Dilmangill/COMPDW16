#!/bin/bash
# this script gets 2 numbers from client 
# dice per count and sides per count
# it prints out the results of rolling those dice
# Variables
###########
# the number of dice=count will be kept in $count, defaulting to 2
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
	./filename -c 4 # it will specify the number of dices which will be 4
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
		shift
	else
		echo "I wanted a number after the -c, from 1 to 5. CYA Bozo!"
		exit 2
		fi
	;;
	-s )
	if [[ "$2" =~ ^[1-9][0-9]*$ ]]; then
		if [ "$2" -ge 4 -a "$2" -le 20 ]; then
			sides=$2
			shift
		else
			echo "I wanted a number after the -s, from 4 to 20. CYA Bozo!"
		exit 2
		fi
	fi
	shift
	;;
*)
	echo "type -h or --help to get help"
		exit 1
		;;
	esac
	shift
done

if [ -z "$count" ]; then
    # ask the client how many die we want to roll out
    read -p "How many count[1-5, where default is 2]? " numdice

    # use num from 1-5
    if [[ "$numdice" =~ ^[1-5]$ ]]; then
        count=$numdice
    else
        count=2
        echo "Using a default of 2 as you are not very helpful."
    fi 
fi 

if [ -z "$sides" ]; then
    # ask the client how many sides this dice have
    read -p "How many sides[4-20, where default is 6]? " numsides

    # it will use num 4-20
    if [[ "$numsides" =~ ^[1-9][0-9]*$ ]]; then
        if [ $numsides -ge 4 -a $numsides -le 20 ]; then
            sides=$numsides
        else
            sides=6
            echo "Using 6-sided dice, it will be difficult"
        fi
    else
        sides=6
        echo "Using 6-sided dice, it will be difficult"
    fi 
fi

# rolling them and sumup the rolls
while [ $count -gt 0 ]; do

    # it is based on the number of sides
    roll=$(( $RANDOM % $sides +1 ))
    
    # some of all rolls
	   sum=$(( $sum + $roll ))
    
    # give the me feedback about the current roll
    echo "Rolled $roll"
    
    # the loop will end when the count of dice to roll will be zero
    ((count--)) 
    done
# done rolling, display the sum of the rolls
echo "You rolled a total of $sum"
