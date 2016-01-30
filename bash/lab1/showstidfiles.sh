#!/bin/bash
# this script shows the set uid and gid files in /usr
echo "setuid files in /usr"
echo "===================="
find /usr -perm -4000 -type f -ls

cat <<EOF

Setgid files in /usr
====================
EOF

#echo ""
#echo "setguid files in /usr"
#echo "====================="
find /usr -perm -2000 -type f -ls 
#find /usr -perm -2000 -type f -ls | awk '{printf "$11 $3 $6"}' 
