#!/bin/sh

apt-get install openssh-server python3 eject samba ufw lvm2 busybox-syslogd ntp ntpdate
apt-get remove --purge rsyslogd
systemctl enable ssh.service

modprobe dm-mod
echo "\ndm-mod\n" >> /etc/modules
