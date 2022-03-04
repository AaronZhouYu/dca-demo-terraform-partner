# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_4_1_17 < CISRemediation
  def initialize
    super('CIS_RHEL8_4_1_17')
    @title = 'Ensure the audit configuration is immutable (Scored)'
    @scored = true
    @level = 2
    @identifier = '4.1.17'
    @description = '
    "4.1.17 Ensure the audit configuration is immutable (Scored)\nProfile Applicability:\n Level 2 - Server\n Level 2 - Workstation Description:\nSet system audit so that audit rules cannot be modified with auditctl . Setting the flag \"-e 2\" forces audit to be put in immutable mode. Audit changes can only be made on system reboot.\nRationale:\nIn immutable mode, unauthorized users cannot execute changes to the audit system to potentially hide malicious activity and then put the audit rules back. Users would most likely notice a system reboot and that could \nalert administrators of an attempt to make unauthorized audit changes.\nAudit:\nRun the following command and verify output matches:\n      # grep \"^\s*[^#]\" /etc/audit/rules.d/*.rules | tail -1 -e 2\n\nRemediation:\nEdit or create the file /etc/audit/rules.d/99-finalize.rules and add the line -e 2\nat the end of the file\nNotes:\nThis setting will ensure reloading the auditd config to set active settings requires a system reboot.\nCIS Controls:\nVersion 7\n6.2 Activate audit logging\nEnsure that local logging has been enabled on all systems and networking devices.\n6.3 Enable Detailed Logging\nEnable system logging to include detailed information such as an event source, date, user, timestamp, source addresses, destination addresses, and other useful elements.\n\n"
    '
    @script_file = 'CIS_RHEL8_4_1_17.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_4_1_17.sh"}]
  end
end
