#!/bin/bash

function  ctrl_c(){
	echo -e "\n\n[!] Saliendo...\n"
	tput cnorm; exit 1
}


trap ctrl_c INT

networks=(172.18.0 172.19.0)

tput civis; for network in ${networks[@]}; do
	echo -e "\n[+] Enumerando el network $network:"
	for i in $(seq 1 254); do
		timeout 1 bash -c "ping -c 1 $network.$i" &>/dev/null && echo -e "\t[+] Host $network.$i - ACTIVE" &
	done; wait
done; tput cnorm
