#!/bin/bash
#this script displays how many files are in ~/Pictures,
#how much space the use,
#and the sizes and names of the 3 largest files

echo -n "There are "
find ~/Pictures -type f | wc -l
echo " files in the ~/Pictures directory"
#from joseph 
#echo -n "There are"
#find ~/pictures -type f | wc -l | xrags echo -n
#echo " files in the ~/Pictures directory"

  
echo "The Pictures directory uses (in kbytes):"
du -sh ~/Pictures


echo "The 3 largest files in the ~/Pictures directory are:"
#from class guy
#du -h | sort -hr | head -n3


#from class guy
#ls -lnS ~/Pictures | sort -h | head -n

cd ~/Pictures
find . -type f -exec du -h {} \; | sort -n | tail -4
