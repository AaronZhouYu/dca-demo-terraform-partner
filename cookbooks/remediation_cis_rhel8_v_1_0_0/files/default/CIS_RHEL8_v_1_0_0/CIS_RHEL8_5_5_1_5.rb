# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_5_5_1_5 < CISRemediation
  def initialize
    super('CIS_RHEL8_5_5_1_5')
    @title = 'Ensure all users last password change date is in the past (Scored)'
    @scored = true
    @level = 1
    @identifier = '5.5.1.5'
    @description = '
    "5.5.1.5 Ensure all users last password change date is in the past (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nAll users should have a password change date in the past.\nRationale:\nIf a users recorded password change date is in the future then they could bypass any set password expiration.\nAudit:\nRun the following command and verify nothing is returned\nRemediation:\nInvestigate any users with a password change date in the future and correct them. Locking the account, expiring the password, or resetting the password manually may be appropriate.\nCIS Controls:\nVersion 7\n4.4 Use Unique Passwords\nWhere multi-factor authentication is not supported (such as local administrator, root, or service accounts), accounts will use passwords that are unique to that system.\n      # for usr in $(cut -d: -f1 /etc/shadow); do [[ $(chage --list $usr | grep ^Last password change | cut -d: -f2) > $(date) ]] && echo \"$usr :$(chage -- list $usr | grep ^Last password change | cut -d: -f2)\"; \ndone\n\n"
    '
    @script_file = 'CIS_RHEL8_5_5_1_5.rb'
    @commands = [{"script_ruby"=>"ruby #{@script_directory}/CIS_RHEL8_5_5_1_5.rb"}]
  end
end
