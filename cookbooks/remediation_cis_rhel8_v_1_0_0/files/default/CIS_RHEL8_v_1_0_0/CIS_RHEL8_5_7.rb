# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_5_7 < CISRemediation
  def initialize
    super('CIS_RHEL8_5_7')
    @title = 'Ensure access to the su command is restricted (Scored)'
    @scored = true
    @level = 1
    @identifier = '5.7'
    @description = '
    "5.7 Ensure access to the su command is restricted (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation Description:\nThe su command allows a user to run a command or shell as another user. The program has been superseded by sudo , which allows for more granular control over privileged access. Normally, the su command can be \nexecuted by any user. By uncommenting the pam_wheel.so statement in /etc/pam.d/su , the su command will only allow users in the wheel group to execute su .\nRationale:\nRestricting the use of su , and using sudo in its place, provides system administrators better control of the escalation of user privileges to execute privileged commands. The sudo utility also provides a better \nlogging and audit mechanism, as it can log each command executed via sudo , whereas su can only record that a user executed the su program.\nAudit:\nRun the following command and verify output includes matching line:\nRun the following command and verify users in wheel group match site policy. If no users are listed, only root will have access to su.\n      # grep pam_wheel.so /etc/pam.d/su\nauth required pam_wheel.so use_uid\n           # grep wheel /etc/group\nwheel:x:10:root,<user list>\n\nRemediation:\nAdd the following line to the /etc/pam.d/su file:\nauth required pam_wheel.so use_uid\nCreate a comma separated list of users in the wheel statement in the /etc/group file: wheel:x:<G5.7>:root,<user list>\nExample:\nwheel:x:10:root,user1,user2,user3\nCIS Controls:\nVersion 7\n5.1 Establish Secure Configurations\nMaintain documented, standard security configuration standards for all authorized operating systems and software.\n\n"
    '
    @script_file = 'CIS_RHEL8_5_7.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_5_7.sh"}]
  end
end
