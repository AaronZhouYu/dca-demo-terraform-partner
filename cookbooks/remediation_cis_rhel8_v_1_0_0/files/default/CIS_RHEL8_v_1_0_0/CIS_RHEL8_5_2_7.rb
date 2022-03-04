# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_5_2_7 < CISRemediation
  def initialize
    super('CIS_RHEL8_5_2_7')
    @title = 'Ensure SSH MaxAuthTries is set to 4 or less (Scored)'
    @scored = true
    @level = 1
    @identifier = '5.2.7'
    @description = '
    "5.2.7 Ensure SSH MaxAuthTries is set to 4 or less (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation Description:\nThe MaxAuthTries parameter specifies the maximum number of authentication attempts permitted per connection. When the login failure count reaches half the number, error messages will be written to the syslog file \ndetailing the login failure.\nRationale:\nSetting the MaxAuthTries parameter to a low number will minimize the risk of successful brute force attacks to the SSH server. While the recommended setting is 4, set the number based on site policy.\nAudit:\nRun the following command and verify that output MaxAuthTries is 4 or less:\nRemediation:\nEdit the /etc/ssh/sshd_config file to set the parameter as follows: MaxAuthTries 4\nDefault Value:\nMaxAuthTries 6\nCIS Controls:\nVersion 7\n16.13 Alert on Account Login Behavior Deviation\nAlert when users deviate from normal login behavior, such as time-of-day, workstation location and duration.\n      # sshd -T | grep maxauthtries\nMaxAuthTries 4\n\n"
    '
    @script_file = 'CIS_RHEL8_5_2_7.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_5_2_7.sh"}]
  end
end
