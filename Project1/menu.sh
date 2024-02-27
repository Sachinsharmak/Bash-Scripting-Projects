#!/bin/bash

## 
# Color Variable
##
green='\e[32m'
blue='\e[34m'
clear='\e[0m'

ColorGreen(){
	echo -ne $green$1$clear
}
ColorBlue(){
	echo -ne $blue$1$clear
}


##
# BASH menu script that checks:
# - Memory usage
# - CPU load
# - Number of TCP connections
# - Kernel version
##

server_name=$(hostname)

function memory_check(){
	echo ""
	echo "Memory Usage on ${server_name} is:"
	free -h
	echo ""
}
function cpu_check(){
	echo ""
	echo "CPU load on ${server_name}"
	uptime
	echo ""
}
function tcp_checK(){
	echo ""
	echo "TCP Connenction on ${server_name}"
		cat /proc/net/tcp | wc -l
	echo ""
}
function kernal_check() {
	echo ""
	echo "Kernal Version on ${server_name}"
	uname -r
	echo ""
}
function all_check(){
	memory_check
	cpu_check
	tcp_checK
	kernal_check
}

menu(){
echo -ne "
My First Menu
$(ColorGreen '1)') Memory Usage
$(ColorGreen '2)') CPU Load
$(ColorGreen '3)') Number of TCP Connections
$(ColorGreen '4)') Kernal Version
$(ColorGreen '5)') Check All
$(ColorGreen '0)') Exit
$(ColorBlue 'Choose an Option:') "
read a
case $a in
	1) memory_check ; menu ;;
	2) cpu_check ; menu ;;
	3) tcp_checK ; menu ;;
	4) kernal_check ; menu ;;
	5) all_check ; menu ;;
	0) exit 0 ;;
	*) echo -e $red"Wrong Option."$clear;
	WrongCommand ;;

esac
}
menu
