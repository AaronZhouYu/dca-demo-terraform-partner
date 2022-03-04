#!/bin/bash
grep -q '^\+:' /etc/group && sed -ri '/^\+:.*$/ d' /etc/group || echo 'Nothing to do, no legacy "+" entries exist in /etc/group'
