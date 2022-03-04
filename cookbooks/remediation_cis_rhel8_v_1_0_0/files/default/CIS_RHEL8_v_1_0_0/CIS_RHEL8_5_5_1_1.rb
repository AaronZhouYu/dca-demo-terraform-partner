# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_5_5_1_1 < CISRemediation
  def initialize
    super('CIS_RHEL8_5_5_1_1')
    @title = 'Ensure password expiration is 365 days or less (Scored)'
    @scored = true
    @level = 1
    @identifier = '5.5.1.1'
    @description = '
    "5.5.1.1 Ensure password expiration is 365 days or less (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation Description:\nThe PASS_MAX_DAYS parameter in /etc/login.defs allows an administrator to force passwords to expire once they reach a defined age. It is recommended that the PASS_MAX_DAYS parameter be set to less than or equal to \n365 days.\nRationale:\nThe window of opportunity for an attacker to leverage compromised credentials or successfully compromise credentials via an online brute force attack is limited by the age of the password. Therefore, reducing the \nmaximum age of a password also reduces an attackers window of opportunity.\nAudit:\nRun the following command and verify PASS_MAX_DAYS conforms to site policy (no more than 365 days):\nRun the following command and Review list of users and PASS_MAX_DAYS to verify that all users PASS_MAX_DAYS conforms to site policy (no more than 365 days):\n      # grep PASS_MAX_DAYS /etc/login.defs\nPASS_MAX_DAYS 365\n             # grep -E ^[^:]+:[^!*] /etc/shadow | cut -d: -f1,5 <user>:<PASS_MAX_DAYS>\n\nRemediation:\nSet the PASS_MAX_DAYS parameter to conform to site policy in /etc/login.defs : PASS_MAX_DAYS 365\nModify user parameters for all users with a password set to match:\n# chage --maxdays 365 <user>\nNotes:\nYou can also check this setting in /etc/shadow directly. The 5th field should be 365 or less for all users with a password.\nNote: A value of -1 will disable password expiration. Additionally the password expiration must be greater than the minimum days between password changes or users will be unable to change their password.\nCIS Controls:\nVersion 7\n4.4 Use Unique Passwords\nWhere multi-factor authentication is not supported (such as local administrator, root, or service accounts), accounts will use passwords that are unique to that system.\n\n"
    '
    @script_file = 'CIS_RHEL8_5_5_1_1.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_5_5_1_1.sh"}]
  end
end
