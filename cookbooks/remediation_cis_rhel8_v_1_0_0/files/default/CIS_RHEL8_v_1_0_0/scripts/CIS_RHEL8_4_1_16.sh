#!/bin/bash
rpm -qa | grep -q audit && rpm -qa | grep -q audit-libs || dnf install -y audit audit-libs
egrep -q "^-w\s+/var/log/sudo.log\s+-p\s+wa\s+-k\s+actions\s*$" /etc/audit/rules.d/audit.rules || echo "-w /var/log/sudo.log -p wa -k actions" >> /etc/audit/rules.d/audit.rules
systemctl reset-failed auditd.service
systemctl start auditd.service