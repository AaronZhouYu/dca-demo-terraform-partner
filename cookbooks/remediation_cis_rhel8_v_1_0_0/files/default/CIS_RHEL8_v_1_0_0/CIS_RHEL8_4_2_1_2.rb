# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_4_2_1_2 < CISRemediation
  def initialize
    super('CIS_RHEL8_4_2_1_2')
    @title = 'Ensure rsyslog Service is enabled (Scored)'
    @scored = true
    @level = 1
    @identifier = '4.2.1.2'
    @description = '
    "4.2.1.2 Ensure rsyslog Service is enabled (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nOnce the rsyslog package is installed it needs to be activated.\nRationale:\nIf the rsyslog service is not activated the system may default to the syslogd service or lack logging instead.\nAudit:\nRun the following command to verify rsyslog is enabled:\nVerify result is \"enabled\".\n      # systemctl is-enabled rsyslog\nenabled\n\nRemediation:\nRun the following command to enable rsyslog:\n# systemctl --now enable rsyslog\nNotes:\nAdditional methods of enabling a service exist. Consult your distribution documentation for appropriate methods.\nCIS Controls:\nVersion 7\n6.2 Activate audit logging\nEnsure that local logging has been enabled on all systems and networking devices.\n6.3 Enable Detailed Logging\nEnable system logging to include detailed information such as an event source, date, user, timestamp, source addresses, destination addresses, and other useful elements.\n\n"
    '
    @script_file = 'CIS_RHEL8_4_2_1_2.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_4_2_1_2.sh"}]
  end
end
