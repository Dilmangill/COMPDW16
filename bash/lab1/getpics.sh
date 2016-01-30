#!/bin/bash
# this script helps to get pics from wget
cd ~/Pictures
 [ -e pics.zip ] || wget -nv http://zonzorp.net/pics.zip &&
	unzip pics.zip &&
    rm pics.zip
