#!/bin/bash
rpm -qa | grep -q audit && rpm -qa | grep -q audit-libs && systemctl --now enable -q auditd || echo 'Nothing to do, auditd is not installed'