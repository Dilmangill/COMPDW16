#!/bin/bash
#
# this script shows the user the files in their home directory,
# lets them pick one using a menu,
# then displays it using the more command
# build an array of files using the find command
# use the find command to find non-empty regular files in the user's home directory
# use a loop to ask for a choice so that we can ask again if necessary
# display the files as a menu, with a number in front of each
# display a prompt, asking the user to pick a valid menu number
# make sure they gave us a number
# make sure that the number they gave us is valid
# use the "more" command to display the content of the file
# allow them to choose another file
# if they didn't give us a valid number,
# let them know that they messed up and go back through the loop
