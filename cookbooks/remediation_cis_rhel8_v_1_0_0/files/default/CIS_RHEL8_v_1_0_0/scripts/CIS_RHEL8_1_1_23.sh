#!/bin/bash
modprobe -n -v usb-storage | grep '^install /bin/true\s' || echo 'install usb-storage /bin/true' >> /etc/modprobe.d/CIS.conf
lsmod | egrep '^usb-storage\s' && rmmod usb-storage || echo 'Nothing to do, usb-storage module is not loaded'