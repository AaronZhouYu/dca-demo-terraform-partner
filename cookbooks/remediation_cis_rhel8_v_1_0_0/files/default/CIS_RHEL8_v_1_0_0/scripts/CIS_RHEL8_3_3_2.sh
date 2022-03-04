#!/bin/bash
modprobe -n -v sctp | grep -q "^install /bin/true\s" || echo "install sctp /bin/true" >> /etc/modprobe.d/CIS.conf
lsmod | egrep -q "^sctp\s" && rmmod sctp || echo 'SCTP module is not loaded'