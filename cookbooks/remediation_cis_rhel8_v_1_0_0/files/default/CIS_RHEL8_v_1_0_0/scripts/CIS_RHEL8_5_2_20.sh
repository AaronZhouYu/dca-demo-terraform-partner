#!/bin/bash
if egrep -q "^/s*CRYPTO_POLICY=" /etc/sysconfig/sshd; then
  sed -ri "s/^\s*(CRYPTO_POLICY\s*=.*)$/# \1/" /etc/sysconfig/sshd
  systemctl reload sshd
else
  echo "Nothing to do, CRYPTO_POLICY not found in SSH config"
fi