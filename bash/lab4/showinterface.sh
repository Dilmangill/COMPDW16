#!/bin/bash
# this script enumerates our 2 interfaces and
# displays their configured IPV4 addresses
# as well as default route information
# Variables
###########
showroute=0 # default is to not show the default route
declare -A ips # hash of ip addresses keyed on interface name
declare -a intfs # array of interface names supplied on the command line
declare -a interfaces # array of discovered interface names
# Main
######
# check the command line for an interface name or names, and -r|--route
while [ $# -gt 0 ]; do
case "$1" in
-r|--route )
showroute=1 # set showroute to a 1 if asked to display default route
;;
*)
intfs+=("$1") # add unnamed parameters as interface names
;;
esac
shift
done
# Get an array of our interface names, we will have at least 2
interfaces=(`ifconfig |grep '^[A-Za-z]'|awk '{print $1}'`)
# For each interface in the array, get the IP address and
# save it to an array for IP addresses
for intf in ${interfaces[@]}; do
ips[$intf]=`ifconfig $intf|grep "inet "|sed -e 's/.*inet addr://' -e 's/ .*//'`
done
