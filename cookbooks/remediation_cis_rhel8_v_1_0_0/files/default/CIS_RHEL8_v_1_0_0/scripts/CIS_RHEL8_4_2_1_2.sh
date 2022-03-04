#!/bin/bash
rpm -qa | grep -q rsyslog && systemctl --now enable -q rsyslog || echo 'Nothing to do, rsyslog is not installed'