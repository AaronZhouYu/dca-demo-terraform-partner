# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_5_2_15 < CISRemediation
  def initialize
    super('CIS_RHEL8_5_2_15')
    @title = 'Ensure SSH warning banner is configured (Scored)'
    @scored = true
    @level = 1
    @identifier = '5.2.15'
    @description = '
    "5.2.15 Ensure SSH warning banner is configured (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nThe Banner parameter specifies a file whose contents must be sent to the remote user before authentication is permitted. By default, no banner is displayed.\nRationale:\nBanners are used to warn connecting users of the particular sites policy regarding connection. Presenting a warning message prior to the normal user login may assist the prosecution of trespassers on the computer \nsystem.\nAudit:\nRun the following command and verify that output matches:\nRemediation:\nEdit the /etc/ssh/sshd_config file to set the parameter as follows: Banner /etc/issue.net\nCIS Controls:\nVersion 7\n5.1 Establish Secure Configurations\nMaintain documented, standard security configuration standards for all authorized operating systems and software.\n      # sshd -T | grep banner\nBanner /etc/issue.net\n\n"
    '
    @script_file = 'CIS_RHEL8_5_2_15.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_5_2_15.sh"}]
  end
end
