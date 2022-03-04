# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_6_2_18 < CISRemediation
  def initialize
    super('CIS_RHEL8_6_2_18')
    @title = 'Ensure no duplicate group names exist (Scored)'
    @scored = true
    @level = 1
    @identifier = '6.2.18'
    @description = '
    "6.2.18 Ensure no duplicate group names exist (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation Description:\nAlthough the groupadd program will not let you create a duplicate group name, it is possible for an administrator to manually edit the /etc/group file and change the group name.\nRationale:\nIf a group is assigned a duplicate group name, it will create and have access to files with the first G6.2.18 for that group in /etc/group . Effectively, the G6.2.18 is shared, which is a security problem.\nAudit:\nRun the following script and verify no results are returned:\nRemediation:\nBased on the results of the audit script, establish unique names for the user groups. File group ownerships will automatically reflect the change as long as the groups have unique G6.2.18s.\nCIS Controls:\nVersion 7\n16 Account Monitoring and Control Account Monitoring and Control\n      #!/bin/bash\ncut -d: -f1 /etc/group | sort | uniq -d | while read x do echo \"Duplicate group name ${x} in /etc/group\"\ndone\n\n"
    '
    @script_file = ''
    @commands = [{"local"=>"echo 'Automated remediation unavailable. Please remediate manually:\n\nBased on the results of the audit script, establish unique names for the user groups. File group ownerships will automatically reflect the change as long as the groups have unique G6.2.18s.'\n"}]
  end
end
