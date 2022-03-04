#!/bin/bash
egrep -q '^\s*(FUTURE|FIPS)\s*(\s+#.*)?$' /etc/crypto-policies/config; crypto_policies_rc=$?
if [ $crypto_policies_rc -eq 1 ]; then
  if [[ $CRYPTO_POLICY == 'FUTURE' ]]; then
    update-crypto-policies --set FUTURE
  elif [[ $CRYPTO_POLICY == 'FIPS' ]]; then
    fips-mode-setup --enable
  else
    echo 'To configure system-wide crypto policy, environment variable $CRYPTO_POLICY must be set to "FUTURE" or "FIPS"'
  fi
else
  echo 'Nothing to do, system-wide crypto policy is FUTURE or FIPS'
fi