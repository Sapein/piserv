#!/bin/sh

sed -i 's?^exit 0?iwconfig wlan0 power off\nexit 0?' /etc/rc.local
mount -o remount,rw /boot
cmdline=$(cat /boot/cmdline.txt)
printf "%s net.ifnames=0" "${cmdline}" > /boot/cmdline.txt
mount -o remount,ro /boot
