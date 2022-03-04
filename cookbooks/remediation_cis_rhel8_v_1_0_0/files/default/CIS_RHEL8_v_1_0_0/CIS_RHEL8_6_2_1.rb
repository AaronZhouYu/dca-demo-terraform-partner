# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_6_2_1 < CISRemediation
  def initialize
    super('CIS_RHEL8_6_2_1')
    @title = 'Ensure password fields are not empty (Scored)'
    @scored = true
    @level = 1
    @identifier = '6.2.1'
    @description = '
    "6.2.1 Ensure password fields are not empty (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nAn account with an empty password field means that anybody may log in as that user without providing a password.\nRationale:\nAll accounts must have passwords or be locked to prevent the account from being used by an unauthorized user.\nAudit:\nRun the following command and verify that no output is returned:\n# awk -F: ($2 == \"\" ) { print $1 \" does not have a password \"} /etc/shadow\nRemediation:\nIf any accounts in the /etc/shadow file do not have a password, run the following command to lock the account until it can be determined why it does not have a password:\n# passwd -l <username>\nAlso, check to see if the account is logged in and investigate what it is being used for to determine if it needs to be forced off.\nCIS Controls:\nVersion 7\n4.4 Use Unique Passwords\nWhere multi-factor authentication is not supported (such as local administrator, root, or service accounts), accounts will use passwords that are unique to that system.\n\n"
    '
    @script_file = 'CIS_RHEL8_6_2_1.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_6_2_1.sh"}]
  end
end
