#!/bin/bash
rpm -qa | grep -q ypbind && dnf -yq remove ypbind || echo 'Nothing to do, NIS client is not installed'