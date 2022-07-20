#!/bin/bash

function  ctrl_c(){
	echo -e "\n\n[!] Saliendo...\n"
	tput cnorm; exit 1
}


trap ctrl_c INT

hosts=(172.18.0.1 172.18.0.2 172.19.0.1 172.19.0.2 172.19.0.4)

tput civis; for host in ${hosts[@]}; do  
	echo -e "\n[+] Enumerando puertos para el host $host:"
	for port in $(seq 1 10000); do
		timeout 1 bash -c "echo '' > /dev/tcp/$host/$port" 2>/dev/null && echo -e "\t[+] Port $port - OPEN " &
	done; wait
done; tput cnorm
