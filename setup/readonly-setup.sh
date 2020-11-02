#!/bin/sh

printf "It is recommended you do this yourself through raspi-config.\n"
exit 0
rm -rf /var/lib/dhcp /var/lib/dhcpcd5 /var/spool /etc/resolv.conf
ln -s /tmp /var/lib/dhcp
ln -s /tmp /var/lib/dhcpcd5
ln -s /tmp /var/spool
touch /tmp/dhcpcd.resolv.conf
ln -s /tmp/dhcpcd.resolv.conf /etc/resolv.conf

rm /var/lib/systemd/random-seed
ln -s /tmp/random-seed /var/lib/systemd/random-seed

sed -i "/lib/systemd/system/systemd-random-seed.service" -e 's?ExecStart=/lib/systemd/systemd-random-seed load?ExecStart=/lib/systemd/systemd-random-seed load\nExecStart=/lib/systemd/systemd-random-seed load?'

mount -o remount,rw /boot
cmdline=$(cat /boot/cmdline.txt)
printf "%s fastboot noswap ro" "${cmdline}" > /boot/cmdline.txt
mount -o remount,ro /boot

# This changes how ntp works.
cp /lib/systemd/system/ntp.service /etc/systemd/system/ntp.service
sed -i cp /lib/systemd/system/ntp.service /etc/systemd/system/ntp.service
sed -i -e 's?^PrivateTmp=?#PrivateTmp=?' /etc/systemd/system/ntp.service
