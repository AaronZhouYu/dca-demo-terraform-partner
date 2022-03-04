#!/bin/bash
rpm -qa | grep -q xorg-x11* && dnf -yq remove xorg-x11* || echo 'Nothing to do, no X Windows System packages installed'