#!/bin/bash
rm -f ./cis_audit_policyfiles/stage_windows.lock.json; chef install ./cis_audit_policyfiles/stage_windows.rb; chef push stage-windows ./cis_audit_policyfiles/stage_windows.lock.json
rm -f ./cis_audit_policyfiles/stage_redhat.lock.json; chef install ./cis_audit_policyfiles/stage_redhat.rb; chef push stage-redhat ./cis_audit_policyfiles/stage_redhat.lock.json

rm -f ./cis_audit_policyfiles/prod_windows.lock.json; chef install ./cis_audit_policyfiles/prod_windows.rb; chef push prod-windows ./cis_audit_policyfiles/prod_windows.lock.json
rm -f ./cis_audit_policyfiles/prod_redhat.lock.json; chef install ./cis_audit_policyfiles/prod_redhat.rb; chef push prod-redhat ./cis_audit_policyfiles/prod_redhat.lock.json