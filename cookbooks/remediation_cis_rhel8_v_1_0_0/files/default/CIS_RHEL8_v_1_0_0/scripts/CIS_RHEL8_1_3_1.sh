#!/bin/bash
rpm -qa | grep sudo || dnf -y install sudo