#!/bin/bash
rm -f ./baseline_audit_policyfiles/stage_windows.lock.json; chef install ./baseline_audit_policyfiles/stage_windows.rb; chef push stage-windows ./baseline_audit_policyfiles/stage_windows.lock.json
rm -f ./baseline_audit_policyfiles/stage_redhat.lock.json; chef install ./baseline_audit_policyfiles/stage_redhat.rb; chef push stage-redhat ./baseline_audit_policyfiles/stage_redhat.lock.json

rm -f ./baseline_audit_policyfiles/prod_windows.lock.json; chef install ./baseline_audit_policyfiles/prod_windows.rb; chef push prod-windows ./baseline_audit_policyfiles/prod_windows.lock.json
rm -f ./baseline_audit_policyfiles/prod_redhat.lock.json; chef install ./baseline_audit_policyfiles/prod_redhat.rb; chef push prod-redhat ./baseline_audit_policyfiles/prod_redhat.lock.json