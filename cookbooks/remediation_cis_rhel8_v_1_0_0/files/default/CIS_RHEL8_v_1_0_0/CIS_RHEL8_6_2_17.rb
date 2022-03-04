# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_6_2_17 < CISRemediation
  def initialize
    super('CIS_RHEL8_6_2_17')
    @title = 'Ensure no duplicate user names exist (Scored)'
    @scored = true
    @level = 1
    @identifier = '6.2.17'
    @description = '
    "6.2.17 Ensure no duplicate user names exist (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nAlthough the useradd program will not let you create a duplicate user name, it is possible for an administrator to manually edit the /etc/passwd file and change the user name.\nRationale:\nIf a user is assigned a duplicate user name, it will create and have access to files with the first U6.2.17 for that username in /etc/passwd . For example, if \"test4\" has a U6.2.17 of 1000 and a subsequent \"test4\" entry has \na U6.2.17 of 2000, logging in as \"test4\" will use U6.2.17 1000. Effectively, the U6.2.17 is shared, which is a security problem.\nAudit:\nRun the following script and verify no results are returned:\nRemediation:\nBased on the results of the audit script, establish unique user names for the users. File ownerships will automatically reflect the change as long as the users have unique U6.2.17s.\nCIS Controls:\nVersion 7\n16 Account Monitoring and Control Account Monitoring and Control\n      #!/bin/bash\ncut -d: -f1 /etc/passwd | sort | uniq -d | while read x do echo \"Duplicate login name ${x} in /etc/passwd\"\ndone\n\n"
    '
    @script_file = ''
    @commands = [{"local"=>"echo 'Automated remediation unavailable. Please remediate manually:\n\nBased on the results of the audit script, establish unique user names for the users. File ownerships will automatically reflect the change as long as the users have unique U6.2.17s.'\n"}]
  end
end
