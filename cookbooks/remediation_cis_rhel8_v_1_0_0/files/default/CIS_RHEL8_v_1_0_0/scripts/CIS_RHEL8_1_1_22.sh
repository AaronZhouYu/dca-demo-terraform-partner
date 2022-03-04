#!/bin/bash
systemctl --now disable autofs || echo 'Nothing to do, autofs is not enabled or installed'