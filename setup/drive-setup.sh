#!/bin/sh

printf "It is recommended to use lvm-setup\n" 1>&2
exit 0

DRIVE=/dev/sda
parted "${DRIVE}" rm 1
parted -a optimal "${DRIVE}" mkpart primary ext4 0% 100%
mkdir /.drive
#echo "${DRIVE}\t/.drive\text4\tdefaults,noatime,rw\t0\t4" >> /etc/fstab
