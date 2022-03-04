#!/bin/bash
rm -f ./boot_policyfiles/stage_windows.lock.json; chef install ./boot_policyfiles/stage_windows.rb; chef push stage-windows ./boot_policyfiles/stage_windows.lock.json
rm -f ./boot_policyfiles/stage_redhat.lock.json; chef install ./boot_policyfiles/stage_redhat.rb; chef push stage-redhat ./boot_policyfiles/stage_redhat.lock.json

rm -f ./boot_policyfiles/prod_windows.lock.json; chef install ./boot_policyfiles/prod_windows.rb; chef push prod-windows ./boot_policyfiles/prod_windows.lock.json
rm -f ./boot_policyfiles/prod_redhat.lock.json; chef install ./boot_policyfiles/prod_redhat.rb; chef push prod-redhat ./boot_policyfiles/prod_redhat.lock.json
