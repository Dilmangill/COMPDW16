#!/bin/bash
# this script enumerates our 2 interfaces and
# displays their configured IPV4 addresses
# as well as default route information


# Variables
###########
Mainroute=0 # do not show any route
declare -A iphash # hash of ip addresses 
declare -a int # array of interface names on the command line
declare -a intfc # interface names

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

#look for interface name or names, and -r|--route
while [ $# -gt 0 ]; do
	case "$1" in
	-h| --help )
		Help_Function
		exit 0
		;;

	-r|--route )
		Mainroute=1 # showroute to a 1 if asked to display default route
	;;
*)
	if [ $? -eq ]; then

		int+=("$1") # interface names
	else
		exit1
	fi
	;;
	esac
	shift
done


# Get interface names, we will have at least 2
intfc=(`ifconfig |grep '^[A-Za-z]'|awk '{print $1}'`)


# For each interface 
# save for IP addresses
for intf in ${intfc[@]}; do
	iphash[$intf]=`ifconfig $intf|grep "inet "|sed -e 's/.*inet addr://' -e 's/ .*//'`
done

# Get default route gateway IP from the command
gwip=`route -n|grep '^0.0.0.0'|awk '{print $2}'`


# Display the information  as requested
if [ ${#int[@]} -gt 0 ]; then # use interface list if we have one
	for intf in ${int[@]}; do 

		if [ ${iphash[$intf]} ]; then # show info of interface
		echo "$intf has address ${iphash[$intf]}"
	else # interface with no address 
		echo "$intf which is not an interface on this host or has no ip address assigned"
		fi
	done
else
	for intf in ${intfc[@]}; do # it display all interface
		echo "$intf has address ${iphash[$intf]}"
	done
fi
# show gateway if we were given -r or --route on the command line
[ $Mainroute -eq 1 ] && echo "The defaultroute is through $gwip"
