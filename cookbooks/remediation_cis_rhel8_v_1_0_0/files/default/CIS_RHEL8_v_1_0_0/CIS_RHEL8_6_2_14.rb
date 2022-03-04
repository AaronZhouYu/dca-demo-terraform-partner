# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_6_2_14 < CISRemediation
  def initialize
    super('CIS_RHEL8_6_2_14')
    @title = 'Ensure all groups in /etc/passwd exist in /etc/group (Scored)'
    @scored = true
    @level = 1
    @identifier = '6.2.14'
    @description = '
    "6.2.14 Ensure all groups in /etc/passwd exist in /etc/group (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nOver time, system administration errors and changes can lead to groups being defined in /etc/passwd but not in /etc/group .\nRationale:\nGroups defined in the /etc/passwd file but not in the /etc/group file pose a threat to system security since group permissions are not properly managed.\nAudit:\nRun the following script and verify no results are returned:\n      #!/bin/bash\nfor i in $(cut -s -d: -f4 /etc/passwd | sort -u ); do grep -q -P \"^.*?:[^:]*:$i:\" /etc/group\nif [ $? -ne 0 ]; then\necho \"Group $i is referenced by /etc/passwd but does not exist in /etc/group\"\nfi done\n                   Remediation:\nAnalyze the output of the Audit step above and perform the appropriate action to correct any discrepancies found.\nCIS Controls:\nVersion 7\n16 Account Monitoring and Control Account Monitoring and Control\n\n"
    '
    @script_file = ''
    @commands = [{"local"=>"echo 'Automated remediation unavailable. Please remediate manually:\n\nAnalyze the output of the Audit step above and perform the appropriate action to correct any discrepancies found.'\n"}]
  end
end
