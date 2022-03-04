# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_5_2_14 < CISRemediation
  def initialize
    super('CIS_RHEL8_5_2_14')
    @title = 'Ensure SSH LoginGraceTime is set to one minute or less (Scored)'
    @scored = true
    @level = 1
    @identifier = '5.2.14'
    @description = '
    "5.2.14 Ensure SSH LoginGraceTime is set to one minute or less (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation Description:\nThe LoginGraceTime parameter specifies the time allowed for successful authentication to the SSH server. The longer the Grace period is the more open unauthenticated connections can exist. Like other session controls \nin this session the Grace Period should be limited to appropriate organizational limits to ensure the service is available for needed access.\nRationale:\nSetting the LoginGraceTime parameter to a low number will minimize the risk of successful brute force attacks to the SSH server. It will also limit the number of concurrent unauthenticated connections While the \nrecommended setting is 60 seconds (1 Minute), set the number based on site policy.\nAudit:\nRun the following command and verify that output LoginGraceTime is between 1 and 60:\n      # sshd -T | grep logingracetime\nLoginGraceTime 60\n\nRemediation:\nEdit the /etc/ssh/sshd_config file to set the parameter as follows: LoginGraceTime 60\nDefault Value:\nLoginGraceTime 120\nCIS Controls:\nVersion 7\n5.1 Establish Secure Configurations\nMaintain documented, standard security configuration standards for all authorized operating systems and software.\n\n"
    '
    @script_file = 'CIS_RHEL8_5_2_14.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_5_2_14.sh"}]
  end
end
