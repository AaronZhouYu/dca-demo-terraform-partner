#!/bin/bash
rpm -qa | grep -q cron && systemctl --now enable -q crond || echo 'Nothing to do, crond is not installed'