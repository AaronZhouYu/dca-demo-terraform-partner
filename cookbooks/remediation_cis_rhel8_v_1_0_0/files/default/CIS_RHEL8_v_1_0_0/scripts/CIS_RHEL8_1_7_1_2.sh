#!/bin/bash
grub_cmdline_linux_config=(`grep -E ^GRUB_CMDLINE_LINUX="(.*?)" /etc/default/grub | cut -d '"' -f2`)
if [[ ${grub_cmdline_linux_config[@]} =~ "selinux=0" ]]; then
  grub_cmdline_linux_config=( "${grub_cmdline_linux_config[@]/selinux=0/}" )
fi
if [[ ${grub_cmdline_linux_config[@]} =~ "enforcing=0" ]]; then
  grub_cmdline_linux_config=( "${grub_cmdline_linux_config[@]/enforcing=0/}" )
fi
sed -i '/GRUB_CMDLINE_LINUX=/d' /etc/default/grub; echo "GRUB_CMDLINE_LINUX=\"${grub_cmdline_linux_config[@]}\"" >> /etc/default/grub

grub_cmdline_linux_default_config=(`grep -E ^GRUB_CMDLINE_LINUX_DEFAULT="(.*?)" /etc/default/grub | cut -d '"' -f2`)
if [[ ${grub_cmdline_linux_default_config[@]} =~ "selinux=0" ]]; then
  grub_cmdline_linux_default_config=( "${grub_cmdline_linux_default_config[@]/selinux=0/}" )
fi
if [[ ${grub_cmdline_linux_default_config[@]} =~ "enforcing=0" ]]; then
  grub_cmdline_linux_default_config=( "${grub_cmdline_linux_default_config[@]/enforcing=0/}" )
fi
sed -i '/GRUB_CMDLINE_LINUX_DEFAULT=/d' /etc/default/grub; echo "GRUB_CMDLINE_LINUX_DEFAULT=\"${grub_cmdline_linux_default_config[@]}\"" >> /etc/default/grub

grub2-mkconfig -o /boot/grub2/grub.cfg