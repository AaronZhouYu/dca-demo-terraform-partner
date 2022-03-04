# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_6_2_16 < CISRemediation
  def initialize
    super('CIS_RHEL8_6_2_16')
    @title = 'Ensure no duplicate GIDs exist (Scored)'
    @scored = true
    @level = 1
    @identifier = '6.2.16'
    @description = '
    "6.2.16 Ensure no duplicate G6.2.16s exist (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nAlthough the groupadd program will not let you create a duplicate Group 6.2.16 (G6.2.16), it is possible for an administrator to manually edit the /etc/group file and change the G6.2.16 field.\nRationale:\nUser groups must be assigned unique G6.2.16s for accountability and to ensure appropriate access protections.\nAudit:\nRun the following script and verify no results are returned:\nRemediation:\nBased on the results of the audit script, establish unique G6.2.16s and review all files owned by the shared G6.2.16 to determine which group they are supposed to belong to.\nNotes:\nYou can also use the grpck command to check for other inconsistencies in the /etc/group file.\nCIS Controls:\nVersion 7\n16 Account Monitoring and Control Account Monitoring and Control\n      #!/bin/bash\ncut -d: -f3 /etc/group | sort | uniq -d | while read x ; do echo \"Duplicate G6.2.16 ($x) in /etc/group\"\ndone\n\n"
    '
    @script_file = ''
    @commands = [{"local"=>"echo 'Automated remediation unavailable. Please remediate manually:\n\nBased on the results of the audit script, establish unique G6.2.16s and review all files owned by the shared G6.2.16 to determine which group they are supposed to belong to.'\n"}]
  end
end
