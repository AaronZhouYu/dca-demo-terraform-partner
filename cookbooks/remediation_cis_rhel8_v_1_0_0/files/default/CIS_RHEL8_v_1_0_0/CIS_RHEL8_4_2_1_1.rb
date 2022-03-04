# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_4_2_1_1 < CISRemediation
  def initialize
    super('CIS_RHEL8_4_2_1_1')
    @title = 'Ensure rsyslog is installed (Scored)'
    @scored = true
    @level = 1
    @identifier = '4.2.1.1'
    @description = '
    "4.2.1.1 Ensure rsyslog is installed (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation Description:\nThe rsyslog software is a recommended replacement to the original syslogd daemon which provide improvements over syslogd, such as connection-oriented (i.e. TCP) transmission of logs, the option to log to database \nformats, and the encryption of log data en route to a central logging server.\nRationale:\nThe security enhancements of rsyslog such as connection-oriented (i.e. TCP) transmission of logs, the option to log to database formats, and the encryption of log data en route to a central logging server) justify \ninstalling and configuring the package.\nAudit:\nVerify rsyslog is installed. Run the following command\nRemediation:\nRun the folloing command to install rsyslog:\n# dnf install rsyslog\nCIS Controls:\nVersion 7\n6.2 Activate audit logging\nEnsure that local logging has been enabled on all systems and networking devices.\n6.3 Enable Detailed Logging\nEnable system logging to include detailed information such as an event source, date, user, timestamp, source addresses, destination addresses, and other useful elements.\n      # rpm -q rsyslog\nrsyslog-<version>\n\n"
    '
    @script_file = 'CIS_RHEL8_4_2_1_1.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_4_2_1_1.sh"}]
  end
end
