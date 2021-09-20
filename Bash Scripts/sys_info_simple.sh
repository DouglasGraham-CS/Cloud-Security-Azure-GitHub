#!/bin/bash
date=`date +%D`
uname=`uname`
IPad=`hostname -i`
hostname=`hostname`
echo System Info
echo "Today's date: $date"
echo "Operating system: $uname"
echo "IP address: $IPad"
echo "Hostname: $hostname"