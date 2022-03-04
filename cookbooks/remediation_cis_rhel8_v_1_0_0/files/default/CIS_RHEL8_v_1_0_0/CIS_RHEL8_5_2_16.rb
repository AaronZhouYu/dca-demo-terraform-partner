# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_5_2_16 < CISRemediation
  def initialize
    super('CIS_RHEL8_5_2_16')
    @title = 'Ensure SSH PAM is enabled (Scored)'
    @scored = true
    @level = 1
    @identifier = '5.2.16'
    @description = '
    "5.2.16 Ensure SSH PAM is enabled (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nUsePAM Enables the Pluggable Authentication Module interface. If set to yes this will enable PAM authentication using ChallengeResponseAuthentication and PasswordAuthentication in addition to PAM account and \nsession module processing for all authentication types\nRationale:\nWhen usePAM is set to yes, PAM runs through account and session types properly. This is important if you want to restrict access to services based off of IP, time or other factors of the account. Additionally, you \ncan make sure users inherit certain environment variables on login or disallow access to the server\nAudit:\nRun the following command and verify that output matches:\n      # sshd -T | grep -i usepam\nusepam yes\n\nRemediation:\nEdit the /etc/ssh/sshd_config file to set the parameter as follows:\nUsePAM yes\nImpact:\nIf UsePAM is enabled, you will not be able to run sshd(8) as a non-root user. Default Value:\nusePAM yes\nCIS Controls:\nVersion 7\n5.1 Establish Secure Configurations\nMaintain documented, standard security configuration standards for all authorized operating systems and software.\n\n"
    '
    @script_file = 'CIS_RHEL8_5_2_16.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_5_2_16.sh"}]
  end
end
