#!/bin/bash
modprobe -n -v dccp | grep -q "^install /bin/true\s" || echo "install dccp /bin/true" >> /etc/modprobe.d/CIS.conf
lsmod | egrep -q "^dccp\s" && rmmod dccp || echo 'DCCP module is not loaded'