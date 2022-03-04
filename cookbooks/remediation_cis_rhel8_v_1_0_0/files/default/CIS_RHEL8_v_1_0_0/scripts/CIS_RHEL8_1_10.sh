#!/bin/bash
grep -q '^\s*LEGACY\s*.*$' /etc/crypto-policies/config && update-crypto-policies --set DEFAULT || echo 'Nothing to do, system-wide crypto policy is not legacy'