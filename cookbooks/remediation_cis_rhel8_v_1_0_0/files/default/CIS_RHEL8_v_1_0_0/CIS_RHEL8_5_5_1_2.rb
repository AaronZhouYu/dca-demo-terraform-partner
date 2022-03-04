# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_5_5_1_2 < CISRemediation
  def initialize
    super('CIS_RHEL8_5_5_1_2')
    @title = 'Ensure minimum days between password changes is 7 or more (Scored)'
    @scored = true
    @level = 1
    @identifier = '5.5.1.2'
    @description = '
    "5.5.1.2 Ensure minimum days between password changes is 7 or more (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nThe PASS_MIN_DAYS parameter in /etc/login.defs allows an administrator to prevent users from changing their password until a minimum number of days have passed since the last time the user changed their password. It \nis recommended that PASS_MIN_DAYS parameter be set to 7 or more days.\nRationale:\nBy restricting the frequency of password changes, an administrator can prevent users from repeatedly changing their password in an attempt to circumvent password reuse controls.\nAudit:\nRun the following command and verify PASS_MIN_DAYS conforms to site policy (no less than 7 days):\nRun the following command and Review list of users and PASS_MIN_DAYS to Verify that all users PASS_MIN_DAYS conform s to site policy (no less than 7 days):\n      # grep PASS_MIN_DAYS /etc/login.defs\nPASS_MIN_DAYS 7\n             # grep -E ^[^:]+:[^\!*] /etc/shadow | cut -d: -f1,4 <user>:<PASS_MIN_DAYS>\n\nRemediation:\nSet the PASS_MIN_DAYS parameter to 7 in /etc/login.defs : PASS_MIN_DAYS 7\nModify user parameters for all users with a password set to match: # chage --mindays 7 <user>\nNotes:\nYou can also check this setting in /etc/shadow directly. The 4th field should be 7 or more for all users with a password.\nCIS Controls:\nVersion 7\n4.4 Use Unique Passwords\nWhere multi-factor authentication is not supported (such as local administrator, root, or service accounts), accounts will use passwords that are unique to that system.\n\n"
    '
    @script_file = 'CIS_RHEL8_5_5_1_2.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_5_5_1_2.sh"}]
  end
end
