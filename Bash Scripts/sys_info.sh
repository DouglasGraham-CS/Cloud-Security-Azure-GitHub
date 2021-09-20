#!/bin/bash

if [ $UID == 0 ]
then
	echo "Do not run this script with sudo!"
	exit
fi

find7=$(find /home -type f -perm 777)
IPad=$(ip addr | grep inet | tail -2 | head -1)
output=~/research/sys_info.txt

if [ ! -d $HOME/research ]
then
	mkdir $HOME/research
fi

if [ -f $output ]
then
	rm $output
fi

echo "A Quick System Audit Script" >$output
date >>$output
echo "" >>$output
echo "Machine Type Info:" >>$output
echo $MACHTYPE >>$output
echo -e "Uname info: $(uname -a) \n" >>$output
echo -e "IP Info: $IPad \n" >>$output
echo -e "Hostname: $(hostname -s) \n" >>$output
echo "DNS Servers: " >>$output
cat /etc/resolv.conf >>$output
echo -e "\nMemory Info:" >>$output
free >>$output
echo -e "\nCPU Info:" >>$output
lscpu | grep CPU >>$output
echo -e "\nDisk Usage:" >>$output
df -H | head -2 >>$output
echo -e "\nWho is logged in: \n $(who -a) \n" >>$output
echo -e "\nExec Files:" >>$output
echo $find7 >>$output
echo -e "\nTop 10 Processes" >>$output
ps aux -m | awk {'print $1, $2, $3, $4, $11'} | head >>$output