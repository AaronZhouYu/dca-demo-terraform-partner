# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_5_2_5 < CISRemediation
  def initialize
    super('CIS_RHEL8_5_2_5')
    @title = 'Ensure SSH LogLevel is appropriate (Scored)'
    @scored = true
    @level = 1
    @identifier = '5.2.5'
    @description = '
    "5.2.5 Ensure SSH LogLevel is appropriate (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation Description:\nINFO level is the basic level that only records login activity of SSH users. In many situations, such as Incident Response, it is important to determine when a particular user was active on a system. The logout \nrecord can eliminate those users who disconnected, which helps narrow the field.\nVERBOSE level specifies that login and logout activity as well as the key fingerprint for any SSH key used for login will be logged. This information is important for SSH key management, especially in legacy \nenvironments.\nRationale:\nSSH provides several logging levels with varying amounts of verbosity. DEBUG is specifically not recommended other than strictly for debugging SSH communications since it provides so much data that it is difficult to \nidentify important security information.\nAudit:\nRun the following command and verify that output matches:\n      # sshd -T | grep loglevel\nLogLevel VERBOSE\nOR\nloglevel INFO\n\nRemediation:\nEdit the /etc/ssh/sshd_config file to set the parameter as follows: LogLevel VERBOSE\nOR\nLogLevel INFO\nDefault Value:\nLogLevel INFO\nReferences:\n1. https://www.ssh.com/ssh/sshd_config/ CIS Controls:\nVersion 7\n6.2 Activate audit logging\nEnsure that local logging has been enabled on all systems and networking devices.\n6.3 Enable Detailed Logging\nEnable system logging to include detailed information such as an event source, date, user, timestamp, source addresses, destination addresses, and other useful elements.\n\n"
    '
    @script_file = 'CIS_RHEL8_5_2_5.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_5_2_5.sh"}]
  end
end
