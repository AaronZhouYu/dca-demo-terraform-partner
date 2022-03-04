# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_5_2_13 < CISRemediation
  def initialize
    super('CIS_RHEL8_5_2_13')
    @title = 'Ensure SSH Idle Timeout Interval is configured (Scored)'
    @scored = true
    @level = 1
    @identifier = '5.2.13'
    @description = '
    "5.2.13 Ensure SSH Idle Timeout Interval is configured (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation Description:\nThe two options ClientAliveInterval and ClientAliveCountMax control the timeout of ssh sessions. When the ClientAliveInterval variable is set, ssh sessions that have no activity for the specified length of time are \nterminated. When the ClientAliveCountMax variable is set, sshd will send client alive messages at every ClientAliveInterval interval. When the number of consecutive client alive messages are sent with no response \nfrom the client, the ssh session is terminated. For example, if the ClientAliveInterval is set to 15 seconds and the ClientAliveCountMax is set to 3, the client ssh session will be terminated after 45 seconds of idle \ntime.\nRationale:\nHaving no timeout value associated with a connection could allow an unauthorized user access to another users ssh session (e.g. user walks away from their computer and doesnt lock the screen). Setting a timeout \nvalue at least reduces the risk of this happening..\nWhile the recommended setting is 300 seconds (5 minutes), set this timeout value based on site policy. The recommended setting for ClientAliveCountMax is 0. In this case, the client session will be terminated after 5 \nminutes of idle time and no keepalive messages will be sent.\nAudit:\nRun the following commands and verify ClientAliveInterval is between 1 and 300 and ClientAliveCountMax is 3 or less:\n      # sshd -T | grep clientaliveinterval\nClientAliveInterval 300\n# sshd -T | grep clientalivecountmax\nClientAliveCountMax 0\n\nRemediation:\nEdit the /etc/ssh/sshd_config file to set the parameters according to site policy:\nDefault Value:\nClientAliveInterval 300 ClientAliveCountMax 0\nCIS Controls:\nVersion 7\n16.11 Lock Workstation Sessions After Inactivity\nAutomatically lock workstation sessions after a standard period of inactivity.\n      ClientAliveInterval 300\nClientAliveCountMax 0\n\n"
    '
    @script_file = 'CIS_RHEL8_5_2_13.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_5_2_13.sh"}]
  end
end
