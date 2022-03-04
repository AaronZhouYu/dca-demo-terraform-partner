#!/bin/bash
rpm -qa | grep -q telnet && dnf -yq remove telnet || echo 'Nothing to do, telnet client is not installed'