# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_6_2_19 < CISRemediation
  def initialize
    super('CIS_RHEL8_6_2_19')
    @title = 'Ensure shadow group is empty (Scored)'
    @scored = true
    @level = 1
    @identifier = '6.2.19'
    @description = '
    "6.2.19 Ensure shadow group is empty (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nThe shadow group allows system programs which require access the ability to read the /etc/shadow file. No users should be assigned to the shadow group.\nRationale:\nAny users assigned to the shadow group would be granted read access to the /etc/shadow file. If attackers can gain read access to the /etc/shadow file, they can easily run a password cracking program against the \nhashed passwords to break them. Other security information that is stored in the /etc/shadow file (such as expiration) could also be useful to subvert additional user accounts.\nAudit:\nRun the following commands and verify no results are returned:\nRemediation:\nRemove all users from the shadow group, and change the primary group of any users with shadow as their primary group.\nCIS Controls:\nVersion 7\n5.1 Establish Secure Configurations\nMaintain documented, standard security configuration standards for all authorized operating systems and software.\n      # grep ^shadow:[^:]*:[^:]*:[^:]+ /etc/group\n# awk -F: ($4 == \"<shadow-gid>\") { print } /etc/passwd\n\n"
    '
    @script_file = ''
    @commands = [{"local"=>"echo 'Automated remediation unavailable. Please remediate manually:\n\nRemove all users from the shadow group, and change the primary group of any users with shadow as their primary group.'\n"}]
  end
end
