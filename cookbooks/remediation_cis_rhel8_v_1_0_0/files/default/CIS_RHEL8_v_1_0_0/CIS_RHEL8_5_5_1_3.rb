# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_5_5_1_3 < CISRemediation
  def initialize
    super('CIS_RHEL8_5_5_1_3')
    @title = 'Ensure password expiration warning days is 7 or more (Scored)'
    @scored = true
    @level = 1
    @identifier = '5.5.1.3'
    @description = '
    "5.5.1.3 Ensure password expiration warning days is 7 or more (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation Description:\nThe PASS_WARN_AGE parameter in /etc/login.defs allows an administrator to notify users that their password will expire in a defined number of days. It is recommended that the PASS_WARN_AGE parameter be set to 7 or \nmore days.\nRationale:\nProviding an advance warning that a password will be expiring gives users time to think of a secure password. Users caught unaware may choose a simple password or write it down where it may be discovered.\nAudit:\nRun the following command and verify PASS_WARN_AGE conforms to site policy (No less than 7 days):\nVerify all users with a password have their number of days of warning before password expires set to 7 or more:\nRun the following command and Review list of users and PASS_WARN_AGE to verify that all users PASS_WARN_AGE conforms to site policy (No less than 7 days):\n      # grep PASS_WARN_AGE /etc/login.defs\nPASS_WARN_AGE 7\n             # grep -E ^[^:]+:[^\!*] /etc/shadow | cut -d: -f1,6\n     <user>:<PASS_WARN_AGE>\n\nRemediation:\nSet the PASS_WARN_AGE parameter to 7 in /etc/login.defs : PASS_WARN_AGE 7\nModify user parameters for all users with a password set to match: # chage --warndays 7 <user>\nNotes:\nYou can also check this setting in /etc/shadow directly. The 6th field should be 7 or more for all users with a password.\nCIS Controls:\nVersion 7\n4.4 Use Unique Passwords\nWhere multi-factor authentication is not supported (such as local administrator, root, or service accounts), accounts will use passwords that are unique to that system.\n\n"
    '
    @script_file = 'CIS_RHEL8_5_5_1_3.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_5_5_1_3.sh"}]
  end
end
