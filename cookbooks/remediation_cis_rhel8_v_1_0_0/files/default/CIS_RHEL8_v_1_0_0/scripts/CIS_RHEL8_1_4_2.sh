#!/bin/bash
( crontab -u root -l; crontab -u root -l | egrep -q '^0 5 \* \* \* /usr/sbin/aide --check$' || echo '0 5 * * * /usr/sbin/aide --check' ) | crontab -u root -