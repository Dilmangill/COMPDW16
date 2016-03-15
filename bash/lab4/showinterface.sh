#!/bin/bash
# this script enumerates our 2 interfaces and
# displays their configured IPV4 addresses
# as well as default route information


# Variables
###########
Mainroute=0 # default is to not show the default route
declare -A iphash # hash of ip addresses keyed on interface name
declare -a int # array of interface names supplied on the command line
declare -a intfc # array of discovered interface names

#help_Function
Help_Function(){
	cat<<-EOF
		This will print the ipv4 addresses
		for the arguments in command line
		And When interface name is not given
		it will print information of all interfaces
		
		other arguents

		filename --route or -r	#It will print Main route
		filename interfacename	#it will print ipv4 address of provided interface
	EOF
}

error-message () {
        echo "error-message $filename: $1" >&2
	echo "use -h or --help option to get help"
}

# Main
######

# check the command line for an interface name or names, and -r|--route
while [ $# -gt 0 ]; do
	case "$1" in
	-h| --help )
		Help_Function
		exit 0
		;;

	-r|--route )
		Mainroute=1 # set showroute to a 1 if asked to display default route
	;;
*)
		int+=("$1") # add unnamed parameters as interface names
	;;
	esac
	shift
done


# Get an array of our interface names, we will have at least 2
intfc=(`ifconfig |grep '^[A-Za-z]'|awk '{print $1}'`)


# For each interface in the array, get the IP address and
# save it to an array for IP addresses
for intf in ${intfc[@]}; do
	iphash[$intf]=`ifconfig $intf|grep "inet "|sed -e 's/.*inet addr://' -e 's/ .*//'`
done

# Get default route gateway IP from the route command
gwip=`route -n|grep '^0.0.0.0'|awk '{print $2}'`


# Display the information we have gathered as requested
if [ ${#int[@]} -gt 0 ]; then # use specified interface list if we have one
	for intf in ${int[@]}; do # iterate over interface names requested
		if [ ${iphash[$intf]} ]; then # only display info for an interface if we have some
		echo "$intf has address ${iphash[$intf]}"
	else # for invalid interface names or interfaces with no address, just let the user know about it
		echo "$intf is not an interface on this host or has no ip address assigned"
		fi
	done
else
	for intf in ${intfc[@]}; do # if no interfaces specified, display them all
		echo "$intf has address ${iphash[$intf]}"
	done
fi
# display the default route gateway if we were given -r or --route on the command line
[ $Mainroute -eq 1 ] && echo "The default route is through $gwip"
