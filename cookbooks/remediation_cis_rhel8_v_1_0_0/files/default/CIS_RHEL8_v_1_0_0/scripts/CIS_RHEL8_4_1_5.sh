#!/bin/bash
rpm -qa | grep -q audit && rpm -qa | grep -q audit-libs || dnf install -y audit audit-libs
egrep -q "^-w\s+/var/run/utmp\s+-p\s+wa\s+-k\s+session\s*$" /etc/audit/rules.d/audit.rules || echo "-w /var/run/utmp -p wa -k session" >> /etc/audit/rules.d/audit.rules
egrep -q "^-w\s+/var/log/wtmp\s+-p\s+wa\s+-k\s+logins\s*$" /etc/audit/rules.d/audit.rules || echo "-w /var/log/wtmp -p wa -k logins" >> /etc/audit/rules.d/audit.rules
egrep -q "^-w\s+/var/log/btmp\s+-p\s+wa\s+-k\s+logins\s*$" /etc/audit/rules.d/audit.rules || echo "-w /var/log/btmp -p wa -k logins" >> /etc/audit/rules.d/audit.rules
systemctl reset-failed auditd.service
systemctl start auditd.service