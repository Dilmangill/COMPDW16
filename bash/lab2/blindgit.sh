#!/bin/bash
#this script saves all changed and new files to github

#add files which have changed or been addes or deleted
# to our file list
git add -A
 

#commit our changes, using the command line arguements 
#my commit comment

git commit -m "$1"

#push the committed changes to github
 
git push
