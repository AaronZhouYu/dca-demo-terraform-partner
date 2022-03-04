#!/bin/bash
grub_cmdline_linux_config=(`grep -E ^GRUB_CMDLINE_LINUX="(.*?)" /etc/default/grub | cut -d '"' -f2`)
if [[ ${grub_cmdline_linux_config[@]} =~ "ipv6.disable=0" ]]; then
  grub_cmdline_linux_config=( "${grub_cmdline_linux_config[@]/ipv6.disable=0/}" )
fi
if [[ ! ${grub_cmdline_linux_config[@]} =~ "ipv6.disable=1" ]]; then
  grub_cmdline_linux_config+=("ipv6.disable=1")
fi
sed -i '/GRUB_CMDLINE_LINUX=/d' /etc/default/grub; echo "GRUB_CMDLINE_LINUX=\"${grub_cmdline_linux_config[@]}\"" >> /etc/default/grub
grub2-mkconfig –o /boot/grub2/grub.cfg