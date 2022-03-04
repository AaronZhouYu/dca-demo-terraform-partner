#!/bin/bash
modprobe -n -v cramfs | grep '^install /bin/true\s' || echo 'install cramfs /bin/true' >> /etc/modprobe.d/CIS.conf
lsmod | egrep '^cramfs\s' && rmmod cramfs || echo 'Nothing to do, cramfs module is not loaded'