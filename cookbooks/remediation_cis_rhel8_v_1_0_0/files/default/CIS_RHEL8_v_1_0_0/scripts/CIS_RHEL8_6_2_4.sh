#!/bin/bash
grep -q '^\+:' /etc/shadow && sed -ri '/^\+:.*$/ d' /etc/shadow || echo 'Nothing to do, no legacy "+" entries exist in /etc/shadow'
