# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_4_1_1_1 < CISRemediation
  def initialize
    super('CIS_RHEL8_4_1_1_1')
    @title = 'Ensure auditd is installed (Scored)'
    @scored = true
    @level = 2
    @identifier = '4.1.1.1'
    @description = '
    "4.1.1.1 Ensure auditd is installed (Scored)\nProfile Applicability:\n Level 2 - Server\n Level 2 - Workstation\nDescription:\nauditd is the userspace component to the Linux Auditing System. Its responsible for writing audit records to the disk\nRationale:\nThe capturing of system events provides system administrators with information to allow them to determine if unauthorized access to their system is occurring.\nAudit:\nRun the following command and verify auditd is installed:\n#  rpm -q audit audit-libs\nRemediation:\nRun the following command to Install auditd\n# dnf install audit audit-libs\nCIS Controls:\nVersion 7\n6.2 Activate audit logging\nEnsure that local logging has been enabled on all systems and networking devices.\n6.3 Enable Detailed Logging\nEnable system logging to include detailed information such as an event source, date, user, timestamp, source addresses, destination addresses, and other useful elements.\n\n"
    '
    @script_file = 'CIS_RHEL8_4_1_1_1.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_4_1_1_1.sh"}]
  end
end
