#!/bin/bash
audit_backlog_limit=${AUDIT_BACKLOG_LIMIT:-8192}
grub_cmdline_linux_config=(`grep -E ^GRUB_CMDLINE_LINUX="(.*?)" /etc/default/grub | cut -d '"' -f2`)
for index in "${!grub_cmdline_linux_config[@]}"; do
  [[ ${grub_cmdline_linux_config[$index]} =~ ^audit_backlog_limit=.*$ ]] && unset -v 'grub_cmdline_linux_config[$index]'
done
if [[ ! ${grub_cmdline_linux_config[@]} =~ "audit_backlog_limit=${audit_backlog_limit}" ]]; then
  grub_cmdline_linux_config+=("audit_backlog_limit=${audit_backlog_limit}")
  sed -i '/GRUB_CMDLINE_LINUX=/d' /etc/default/grub; echo "GRUB_CMDLINE_LINUX=\"${grub_cmdline_linux_config[@]}\"" >> /etc/default/grub
  grub2-mkconfig -o /boot/grub2/grub.cfg
fi