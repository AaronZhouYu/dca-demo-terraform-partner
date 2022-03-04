#!/bin/bash
modprobe -n -v squashfs | grep '^install /bin/true\s' || echo 'install squashfs /bin/true' >> /etc/modprobe.d/CIS.conf
lsmod | egrep '^squashfs\s' && rmmod squashfs || echo 'Nothing to do, squashfs module is not loaded'