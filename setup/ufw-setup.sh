#!/bin/sh

ufw default deny incoming
ufw defauly allow outgoing
ufw enable
ufw allow from 192.168.1.0/24 to any port 22
ufw allow from 192.168.1.0/24 to any port 21
ufw allow http
ufw allow https


ufw allow in on eth0 to any port 137
ufw allow in on eth0 to any port 138 proto udp
ufw allow in on eth0 to any port 139
ufw allow in on eth0 to any port 445 proto tcp
ufw allow out on eth0 to any port 137
ufw allow out on eth0 to any port 138 proto udp
ufw allow out on eth0 to any port 139
ufw allow out on eth0 to any port 445 proto tcp
