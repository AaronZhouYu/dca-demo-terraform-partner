# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_6_2_15 < CISRemediation
  def initialize
    super('CIS_RHEL8_6_2_15')
    @title = 'Ensure no duplicate UIDs exist (Scored)'
    @scored = true
    @level = 1
    @identifier = '6.2.15'
    @description = '
    "6.2.15 Ensure no duplicate U6.2.15s exist (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation Description:\nAlthough the useradd program will not let you create a duplicate User 6.2.15 (U6.2.15), it is possible for an administrator to manually edit the /etc/passwd file and change the U6.2.15 field.\nRationale:\nUsers must be assigned unique U6.2.15s for accountability and to ensure appropriate access protections.\nAudit:\nRun the following script and verify no results are returned:\n      #!/bin/bash\ncut -f3 -d\":\" /etc/passwd | sort -n | uniq -c | while read x ; do [ -z \"$x\" ] && break\nset - $x\nif [ $1 -gt 1 ]; then\nusers=$(awk -F: ($3 == n) { print $1 } n=$2 /etc/passwd | xargs)\n    echo \"Duplicate U6.2.15 ($2): $users\"\n  fi\ndone\n                     Remediation:\nBased on the results of the audit script, establish unique U6.2.15s and review all files owned by the shared U6.2.15s to determine which U6.2.15 they are supposed to belong to.\nCIS Controls:\nVersion 7\n16 Account Monitoring and Control Account Monitoring and Control\n\n"
    '
    @script_file = ''
    @commands = [{"local"=>"echo 'Automated remediation unavailable. Please remediate manually:\n\nBased on the results of the audit script, establish unique U6.2.15s and review all files owned by the shared U6.2.15s to determine which U6.2.15 they are supposed to belong to.'\n"}]
  end
end
