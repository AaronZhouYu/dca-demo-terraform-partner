#!/bin/bash
modprobe -n -v rds | grep -q "^install /bin/true\s" || echo "install rds /bin/true" >> /etc/modprobe.d/CIS.conf
lsmod | egrep -q "^rds\s" && rmmod rds || echo 'RDS module is not loaded'