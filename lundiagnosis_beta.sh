#!/bin/bash

#required dependencies: AWK / sensors /

while [ true ]; do

date_hours=$(date)
username=$(whoami)
kernel_version=$(uname -r)
cpu_temp=$(cat /sys/class/thermal/thermal_zone0/temp | awk '{print ($1/1000)}')
local_ip=$(ip addr show | grep 'inet ' | grep -v '127.0.0.1' | cut -d' ' -f6)
uptime=$(uptime -p)

#checking if the user has used sudo

if [ "$username" = "root" ]; then
  echo "W: running as root, there is no reason to use this as root"
fi

echo "                  ------- $date_hours  -------"
echo "----------------------------------------------------------------------------"
echo
echo "GENERAL TAB"
echo
echo "PC uptime:" $uptime
echo "user name:" $username
echo "kernel version:" $kernel_version
echo "local ip of this pc:" $local_ip
echo "----------------------------------------------------------------------------"
echo
echo CPU temp
echo
echo "CPU temp:" $cpu_temp C
echo
echo "----------------------------------------------------------------------------"
echo
echo "RAM"
echo
echo "ram amount:" && free -ght
echo "----------------------------------------------------------------------------"
echo
echo "USB devices"
echo
lsusb

#change it to increase or decrease the refresh rate, now it is 1 which means every 1 second it updates (of course the clock will also update every selected number of seconds so the default is 1)
sleep 1

clear
done


