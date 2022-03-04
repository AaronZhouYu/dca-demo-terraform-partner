# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_5_2_10 < CISRemediation
  def initialize
    super('CIS_RHEL8_5_2_10')
    @title = 'Ensure SSH root login is disabled (Scored)'
    @scored = true
    @level = 1
    @identifier = '5.2.10'
    @description = '
    "5.2.10 Ensure SSH root login is disabled (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nThe PermitRootLogin parameter specifies if the root user can log in using ssh. The default is no.\nRationale:\nDisallowing root logins over SSH requires system admins to authenticate using their own individual account, then escalating to root via sudo or su. This in turn limits opportunity for non-repudiation and provides a \nclear audit trail in the event of a security incident\nAudit:\nRun the following command and verify that output matches:\nRemediation:\nEdit the /etc/ssh/sshd_config file to set the parameter as follows: PermitRootLogin no\nDefault Value:\nPermitRootLogin without-password\nCIS Controls:\nVersion 7\n4.3 Ensure the Use of Dedicated Administrative Accounts\nEnsure that all users with administrative account access use a dedicated or secondary account for elevated activities. This account should only be used for administrative activities and not internet browsing, email, \nor similar activities.\n      # sshd -T | grep permitrootlogin\nPermitRootLogin no\n\n"
    '
    @script_file = 'CIS_RHEL8_5_2_10.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_5_2_10.sh"}]
  end
end
