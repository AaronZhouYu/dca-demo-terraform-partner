# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_5_2_8 < CISRemediation
  def initialize
    super('CIS_RHEL8_5_2_8')
    @title = 'Ensure SSH IgnoreRhosts is enabled (Scored)'
    @scored = true
    @level = 1
    @identifier = '5.2.8'
    @description = '
    "5.2.8 Ensure SSH IgnoreRhosts is enabled (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nThe IgnoreRhosts parameter specifies that .rhosts and .shosts files will not be used in RhostsRSAAuthentication or HostbasedAuthentication.\nRationale:\nSetting this parameter forces users to enter a password when authenticating with ssh.\nAudit:\nRun the following command and verify that output matches:\nRemediation:\nEdit the /etc/ssh/sshd_config file to set the parameter as follows: IgnoreRhosts yes\nDefault Value:\nIgnoreRhosts yes\nCIS Controls:\nVersion 7\n9.2 Ensure Only Approved Ports, Protocols and Services Are Running\nEnsure that only network ports, protocols, and services listening on a system with validated business needs, are running on each system.\n      # sshd -T | grep ignorerhosts\nIgnoreRhosts yes\n\n"
    '
    @script_file = 'CIS_RHEL8_5_2_8.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_5_2_8.sh"}]
  end
end
