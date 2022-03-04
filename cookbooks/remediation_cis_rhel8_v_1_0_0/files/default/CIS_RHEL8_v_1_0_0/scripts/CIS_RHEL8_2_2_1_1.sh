#!/bin/bash
rpm -qa | grep -q chrony || dnf -y install chrony