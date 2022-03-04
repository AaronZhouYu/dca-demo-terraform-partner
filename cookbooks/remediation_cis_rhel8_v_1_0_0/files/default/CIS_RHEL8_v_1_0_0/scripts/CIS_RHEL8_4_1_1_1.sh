#!/bin/bash
rpm -qa | grep -q audit && rpm -qa | grep -q audit-libs || dnf install -y audit audit-libs