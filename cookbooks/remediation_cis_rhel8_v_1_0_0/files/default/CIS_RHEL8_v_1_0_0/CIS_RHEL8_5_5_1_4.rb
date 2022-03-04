# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_5_5_1_4 < CISRemediation
  def initialize
    super('CIS_RHEL8_5_5_1_4')
    @title = 'Ensure inactive password lock is 30 days or less (Scored)'
    @scored = true
    @level = 1
    @identifier = '5.5.1.4'
    @description = '
    "5.5.1.4 Ensure inactive password lock is 30 days or less (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nUser accounts that have been inactive for over a given period of time can be automatically disabled. It is recommended that accounts that are inactive for 30 days after password expiration be disabled.\nRationale:\nInactive accounts pose a threat to system security since the users are not logging in to notice failed login attempts or other anomalies.\nAudit:\nRun the following command and verify INACTIVE conforms to sire policy (no more than 30 days):\nVerify all users with a password have Password inactive no more than 30 days after password expires:\nRun the following command and Review list of users and INACTIVE to verify that all users INACTIVE conforms to site policy (no more than 30 days):\n      # useradd -D | grep INACTIVE\nINACTIVE=30\n             # grep -E ^[^:]+:[^\!*] /etc/shadow | cut -d: -f1,7 <user>:<INACTIVE>\n\nRemediation:\nRun the following command to set the default password inactivity period to 30 days:\n# useradd -D -f 30\nModify user parameters for all users with a password set to match:\n# chage --inactive 30 <user>\nNotes:\nYou can also check this setting in /etc/shadow directly. The 7th field should be 30 or less for all users with a password.\nNote: A value of -1 would disable this setting.\nCIS Controls:\nVersion 7\n4.4 Use Unique Passwords\nWhere multi-factor authentication is not supported (such as local administrator, root, or service accounts), accounts will use passwords that are unique to that system.\n\n"
    '
    @script_file = 'CIS_RHEL8_5_5_1_4.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_5_5_1_4.sh"}]
  end
end
