#!/bin/bash
#This script backup my ~/bin to ~/backup using rsync


cd ~
rsync -avHAXS ~/bin ~/backups
 
