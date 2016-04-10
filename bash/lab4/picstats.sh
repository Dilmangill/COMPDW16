#!/bin/bash
# this script will show how many files are in given directory,
# how much MB or Kilobytes they are of, names of the 3 largest files

#default directory
dir=~/Pictures

#defult number
default=2


#help function for the client
help_function() {


	cat <<-EOF
		This  will count the number of pictures in Directory
		And size of the Directory and also name of file
		

	Option Arguments
	-c and --count (count the Number of files)

	Example:
		./filename -c 2  # print the 2 largest files in the given directory in command line

	EOF
}


#error message-function
error-message () {
	echo "error message $filename: $1 " >&2
}
while [ $# -gt 0 ]; do
	case "$1" in
	-h | --help ) # to run  help function
		help_function
	exit 0
	;;
	-c | --count )
		default=$2
		shift
		;;
	* )
		dir=~/$1
	;;
	esac
	shift
done


#for the count of number of files in given directory
		number=$( find $dir -type f | wc -l )
		echo "Number of files in $dir are $number"

if [ $number -gt 0 ]; then
	echo "The $dir directory uses:"
	du -sh $dir # command to calculate the size of the directory
	echo "The $default largest Pictures in the ~/$dir directory are:"
	cd $dir
# command to find no of largest files in the directory
	find . -type f -exec du -h {} \; | sort -h | tail -$default
else
	error-message " Bad Arguments"
	echo "type -h or --help to get help"
fi
