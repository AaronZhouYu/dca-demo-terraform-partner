# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_4_1_2_1 < CISRemediation
  def initialize
    super('CIS_RHEL8_4_1_2_1')
    @title = 'Ensure audit log storage size is configured (Scored)'
    @scored = true
    @level = 2
    @identifier = '4.1.2.1'
    @description = '
    "4.1.2.1 Ensure audit log storage size is configured (Scored)\nProfile Applicability:\n Level 2 - Server\n Level 2 - Workstation\nDescription:\nConfigure the maximum size of the audit log file. Once the log reaches the maximum size, it will be rotated and a new log file will be started.\nRationale:\nIt is important that an appropriate size is determined for log files so that they do not impact the system and audit data is not lost.\nAudit:\nRun the following command and ensure output is in compliance with site policy:\n      # grep max_log_file /etc/audit/auditd.conf max_log_file = <MB>\n\nRemediation:\nSet the following parameter in /etc/audit/auditd.conf in accordance with site policy: max_log_file = <MB>\nNotes:\nThe max_log_file parameter is measured in megabytes.\nOther methods of log rotation may be appropriate based on site policy. One example is time-based rotation strategies which dont have native support in auditd configurations. Manual audit of custom configurations \nshould be evaluated for effectiveness and completeness.\nCIS Controls:\nVersion 7\n6.4 Ensure adequate storage for logs\nEnsure that all systems that store logs have adequate storage space for the logs generated.\n\n"
    '
    @script_file = 'CIS_RHEL8_4_1_2_1.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_4_1_2_1.sh"}]
  end
end
