# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_5_2_11 < CISRemediation
  def initialize
    super('CIS_RHEL8_5_2_11')
    @title = 'Ensure SSH PermitEmptyPasswords is disabled (Scored)'
    @scored = true
    @level = 1
    @identifier = '5.2.11'
    @description = '
    "5.2.11 Ensure SSH PermitEmptyPasswords is disabled (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nThe PermitEmptyPasswords parameter specifies if the SSH server allows login to accounts with empty password strings.\nRationale:\nDisallowing remote shell access to accounts that have an empty password reduces the probability of unauthorized access to the system\nAudit:\nRun the following command and verify that output matches:\nRemediation:\nEdit the /etc/ssh/sshd_config file to set the parameter as follows: PermitEmptyPasswords no\nDefault Value:\nPermitEmptyPasswords no\nCIS Controls:\nVersion 7\n16.3 Require Multi-factor Authentication\nRequire multi-factor authentication for all user accounts, on all systems, whether managed onsite or by a third-party provider.\n      # sshd -T | grep permitemptypasswords\nPermitEmptyPasswords no\n\n"
    '
    @script_file = 'CIS_RHEL8_5_2_11.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_5_2_11.sh"}]
  end
end
