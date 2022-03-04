#!/bin/bash
modprobe -n -v udf | grep '^install /bin/true\s' || echo 'install udf /bin/true' >> /etc/modprobe.d/CIS.conf
lsmod | egrep '^udf\s' && rmmod udf || echo 'Nothing to do, udf module is not loaded'