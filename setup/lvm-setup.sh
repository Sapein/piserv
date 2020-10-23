#!/bin/sh

DRIVE1=/dev/sda
DRIVE2=/dev/sdb
DRIVE4=/dev/sdd
VGNAME=vg0
LVNAME=storage

parted "${DRIVE1}" rm 1
parted "${DRIVE2}" rm 1
parted "${DRIVE3}" rm 1
parted -a optimal "${DRIVE1}" mkpart primary ext4 0% 100%
parted -a optimal "${DRIVE2}" mkpart primary ext4 0% 100%
parted -a optimal "${DRIVE3}" mkpart primary ext4 0% 100%
parted "${DRIVE1}" set 1 lvm on
parted "${DRIVE2}" set 1 lvm on
parted "${DRIVE3}" set 1 lvm on

pvcreate "${DRIVE1}1" "${DRIVE2}1" "${DRIVE3}1"
vgcreate "${VGNAME}" "${DRIVE1}1" "${DRIVE2}1" "${DRIVE3}1"
lvcreate -l 100%FREE -n "${LVNAME}" "${VGNAME}"
mkfs.ext4 "/dev/${VGNAME}/${LVNAME}"

mkdir drive
mount "/dev/${VGNAME}/${LVNAME}" /.drive
