#!/bin/bash
# this script displays how many files are in ~/Pictures,
# how much space they use,
# and the sizes and names of the 3 largest files
echo -n There are `find ~/Pictures -type f | wc -l`
echo " files in the ~/Pictures directory"
echo "The Pictures directory uses:"
du -sh ~/Pictures
echo "The 3 largest files in the ~/Pictures directory are:"
cd ~/Pictures
find . -type f -exec du -h {} \; | sort -h | tail -3
