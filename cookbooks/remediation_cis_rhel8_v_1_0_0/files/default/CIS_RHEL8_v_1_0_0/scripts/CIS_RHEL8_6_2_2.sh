#!/bin/bash
grep -q '^\+:' /etc/passwd && sed -ri '/^\+:.*$/ d' /etc/passwd || echo 'Nothing to do, no legacy "+" entries exist in /etc/passwd'