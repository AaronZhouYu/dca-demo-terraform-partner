#!/bin/bash
if rpm -qa | grep -q dovecot; then
  systemctl is-enabled -q dovecot && systemctl --now disable -q dovecot || echo 'Nothing to do, IMAP and POP3 server not enabled'
else
  echo 'Nothing to do, IMAP and POP3 server not installed'
fi