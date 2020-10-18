#!/bin/sh

mkdir /.drive/ps2
ln -s /home/ps2
useradd ps2 -d /home/ps2
cp /home/pi/.bashrc /home/ps2/
cp /home/pi/.profile /home/ps2
chown ps2:ps2 -R /home/ps2
