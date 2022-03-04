#!/bin/bash
modprobe -n -v tipc | grep -q "^install /bin/true\s" || echo "install tipc /bin/true" >> /etc/modprobe.d/CIS.conf
lsmod | egrep -q "^tipc\s" && rmmod tipc || echo 'TIPC module is not loaded'