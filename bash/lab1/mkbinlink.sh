#!/bin/bash
#this script creates the link from ~/bin to my ~/workspace/COMPDW16/bash	
# it will not disturb any existing ~/bin filesystem

[ -e ~/bin ] || ln -s workpace/COMPDW16/bash ~/bin
