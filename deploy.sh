#!/bin/sh

setup() {
    ./setup/services.sh
    ./setup/ufw-setup.sh
    ./setup/wifi-setup.sh
    ./setup/lvm-setup.sh
    ./setup/user-setup.sh
    ./setup/samba-setup.sh
    ./setup/readonly-setup.sh
}

deploy_scripts() {
    ln -s scripts/utility/temp /usr/local/bin/temp
    ln -s scripts/udev/autorip-prelude /usr/local/bin/.autorip-prelude
    ln -s scripts/autorip/autorip /usr/local/bin/
    ln -s scripts/autorip/verify /usr/local/bin
}

deploy_config() {
    mv /etc/fstab /etc/fstab.old
    mv /etc/samba/smb.conf /etc/samba/smb.conf.old 
    ln -s config/fstab/fstab /etc/fstab
    ln -s config/udev/rules.d/01-autorip.rules /etc/udev/rules.d/
    ln -s config/samba/smb.conf /etc/samba/smb.conf
}

setup
deploy_scripts
deploy_config

reboot
