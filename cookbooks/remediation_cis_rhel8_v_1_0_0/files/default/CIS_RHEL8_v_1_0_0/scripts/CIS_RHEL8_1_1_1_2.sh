#!/bin/bash
if [ ! -d /sys/firmware/efi ]; then
  modprobe -n -v vfat | grep '^install /bin/true\s' || echo 'install vfat /bin/true' >> /etc/modprobe.d/CIS.conf
  lsmod | egrep '^vfat\s' && rmmod cramfs || echo 'Nothing to do, vfat module is not loaded'
else
  echo 'Automated remediation unavailable. Please remediate manually:
  Run the following command
  grep -E -i "\svfat\s" /etc/fstab
  And review that any output is appropriate for your environment'
fi