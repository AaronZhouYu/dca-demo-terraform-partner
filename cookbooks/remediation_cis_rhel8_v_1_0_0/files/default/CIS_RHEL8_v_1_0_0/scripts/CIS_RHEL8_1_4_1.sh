#!/bin/bash
rpm -qa | grep aide || dnf -y install aide