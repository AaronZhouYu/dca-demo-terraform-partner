#!/bin/bash
systemctl --now disable rhnsd || echo 'Nothing to do, rhnsd is not enabled or installed'