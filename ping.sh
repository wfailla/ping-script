#!/bin/bash

#addresses="any IP address"

# Bash Colors
red='\e[0;31m'
green='\e[0;32m'
NC='\e[0m'

clear

while :
do
        for address in $@ #$addresses
	do
                ping -c1 -W1 $address >> /dev/null
		if [ $? -eq 1 ]
		then
			echo -e "\033[s\033[K\033[u$address:\t${red}is not pingable${NC}"
		else
			echo -e "\033[s\033[K\033[u$address:\t${green}is pingable${NC}"
		fi
	done
	echo -en "Press [CTRL+C] to stop..\033[K"
	sleep 1
	echo -en "\n\033[K"
	echo -en "\033[0;0H"
done
