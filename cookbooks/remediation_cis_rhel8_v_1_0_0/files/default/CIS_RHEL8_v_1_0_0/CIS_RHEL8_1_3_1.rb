# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_1_3_1 < CISRemediation
  def initialize
    super('CIS_RHEL8_1_3_1')
    @title = 'Ensure sudo is installed (Scored)'
    @scored = true
    @level = 1
    @identifier = '1.3.1'
    @description = '
    "1.3.1 Ensure sudo is installed (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nsudo allows a permitted user to execute a command as the superuser or another user, as specified by the security policy. The invoking users real (not effective) user 1.3.1 is used to determine the user name with which \nto query the security policy.\nRationale:\nsudo supports a plugin architecture for security policies and input/output logging. Third parties can develop and distribute their own policy and I/O logging plugins to work seamlessly with the sudo front end. The \ndefault security policy is sudoers, which is configured via the file /etc/sudoers.\nThe security policy determines what privileges, if any, a user has to run sudo. The policy may require that users authenticate themselves with a password or another authentication mechanism. If authentication is \nrequired, sudo will exit if the users password is not entered within a configurable time limit. This limit is policy-specific.\nAudit:\nVerify that sudo in installed. Run the following command:\n      # rpm -q sudo\nsudo-<VERSION>\n\nRemediation:\nRun the following command to install sudo\n# dnf install sudo\nReferences:\n1. SUDO(8)\nCIS Controls:\nVersion 7\n4.3 Ensure the Use of Dedicated Administrative Accounts\nEnsure that all users with administrative account access use a dedicated or secondary account for elevated activities. This account should only be used for administrative activities and not internet browsing, email, \nor similar activities.\n\n"
    '
    @script_file = 'CIS_RHEL8_1_3_1.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_1_3_1.sh"}]
  end
end
