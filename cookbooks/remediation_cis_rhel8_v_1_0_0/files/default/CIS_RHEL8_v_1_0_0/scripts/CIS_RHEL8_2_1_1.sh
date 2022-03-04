#!/bin/bash
rpm -qa | grep xinetd && dnf -yq remove xinetd || echo 'Nothing to do, xinetd is not installed'