#!/bin/bash
if [ ! -f /boot/grub2/user.cfg ]; then
    touch /boot/grub2/user.cfg
fi
if grep -q "^GRUB2_PASSWORD=.*$" /boot/grub2/user.cfg; then
  echo 'Nothing to do, bootloader password is set'
else
  if [ -z "$BOOTLOADER_PASSWORD" ]; then
    echo 'To configure bootloader password, the following environment variable must be set: $BOOTLOADER_PASSWORD'
  else
    echo -e "$BOOTLOADER_PASSWORD\n$BOOTLOADER_PASSWORD" | script -q -c 'grub2-setpassword'
    grub2-mkconfig -o /boot/grub2/grub.cfg
  fi
fi