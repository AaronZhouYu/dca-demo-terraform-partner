#!/bin/bash
rpm -qa | grep -q audit && rpm -qa | grep -q audit-libs || dnf install -y audit audit-libs
if [ ! -f /etc/audit/rules.d/99-finalize.rules ]; then
  touch /etc/audit/rules.d/99-finalize.rules
fi
egrep -q "^-e\s+2\s*$" /etc/audit/rules.d/99-finalize.rules || echo "-e 2" >> /etc/audit/rules.d/99-finalize.rules
service auditd restart