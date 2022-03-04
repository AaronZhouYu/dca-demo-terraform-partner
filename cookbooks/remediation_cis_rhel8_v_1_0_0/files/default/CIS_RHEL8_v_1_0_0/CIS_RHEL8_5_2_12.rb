# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_5_2_12 < CISRemediation
  def initialize
    super('CIS_RHEL8_5_2_12')
    @title = 'Ensure SSH PermitUserEnvironment is disabled (Scored)'
    @scored = true
    @level = 1
    @identifier = '5.2.12'
    @description = '
    "5.2.12 Ensure SSH PermitUserEnvironment is disabled (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nThe PermitUserEnvironment option allows users to present environment options to the ssh daemon.\nRationale:\nPermitting users the ability to set environment variables through the SSH daemon could potentially allow users to bypass security controls (e.g. setting an execution path that has ssh executing trojand programs)\nAudit:\nRun the following command and verify that output matches:\nRemediation:\nEdit the /etc/ssh/sshd_config file to set the parameter as follows: PermitUserEnvironment no\nDefault Value:\nPermitUserEnvironment no\nCIS Controls:\nVersion 7\n5.1 Establish Secure Configurations\nMaintain documented, standard security configuration standards for all authorized operating systems and software.\n      # sshd -T | grep permituserenvironment\nPermitUserEnvironment no\n\n"
    '
    @script_file = 'CIS_RHEL8_5_2_12.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_5_2_12.sh"}]
  end
end
