# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_4_1_2_2 < CISRemediation
  def initialize
    super('CIS_RHEL8_4_1_2_2')
    @title = 'Ensure audit logs are not automatically deleted (Scored)'
    @scored = true
    @level = 2
    @identifier = '4.1.2.2'
    @description = '
    "4.1.2.2 Ensure audit logs are not automatically deleted (Scored)\nProfile Applicability:\n Level 2 - Server\n Level 2 - Workstation\nDescription:\nThe max_log_file_action setting determines how to handle the audit log file reaching the max file size. A value of keep_logs will rotate the logs but never delete old logs.\nRationale:\nIn high security contexts, the benefits of maintaining a long audit history exceed the cost of storing the audit history.\nAudit:\nRun the following command and verify output matches:\n      # grep max_log_file_action /etc/audit/auditd.conf max_log_file_action = keep_logs\n\nRemediation:\nSet the following parameter in /etc/audit/auditd.conf: max_log_file_action = keep_logs\nCIS Controls:\nVersion 7\n6.4 Ensure adequate storage for logs\nEnsure that all systems that store logs have adequate storage space for the logs generated.\n\n"
    '
    @script_file = 'CIS_RHEL8_4_1_2_2.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_4_1_2_2.sh"}]
  end
end
