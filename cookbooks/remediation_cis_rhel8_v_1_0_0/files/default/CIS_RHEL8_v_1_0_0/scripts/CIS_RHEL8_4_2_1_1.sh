#!/bin/bash
rpm -qa | grep -q rsyslog || dnf install -y rsyslog