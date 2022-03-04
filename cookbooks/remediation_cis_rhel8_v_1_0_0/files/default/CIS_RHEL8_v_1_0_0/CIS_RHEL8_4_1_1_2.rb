# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_4_1_1_2 < CISRemediation
  def initialize
    super('CIS_RHEL8_4_1_1_2')
    @title = 'Ensure auditd service is enabled (Scored)'
    @scored = true
    @level = 2
    @identifier = '4.1.1.2'
    @description = '
    "4.1.1.2 Ensure auditd service is enabled (Scored)\nProfile Applicability:\n Level 2 - Server\n Level 2 - Workstation\nDescription:\nTurn on the auditd daemon to record system events.\nRationale:\nThe capturing of system events provides system administrators with information to allow them to determine if unauthorized access to their system is occurring.\nAudit:\nRun the following command to verify auditd is enabled:\nVerify result is \"enabled\".\n      # systemctl is-enabled auditd\nenabled\n\nRemediation:\nRun the following command to enable auditd:\n# systemctl --now enable auditd\nNotes:\nAdditional methods of enabling a service exist. Consult your distribution documentation for appropriate methods.\nCIS Controls:\nVersion 7\n6.2 Activate audit logging\nEnsure that local logging has been enabled on all systems and networking devices.\n6.3 Enable Detailed Logging\nEnable system logging to include detailed information such as an event source, date, user, timestamp, source addresses, destination addresses, and other useful elements.\n\n"
    '
    @script_file = 'CIS_RHEL8_4_1_1_2.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_4_1_1_2.sh"}]
  end
end
