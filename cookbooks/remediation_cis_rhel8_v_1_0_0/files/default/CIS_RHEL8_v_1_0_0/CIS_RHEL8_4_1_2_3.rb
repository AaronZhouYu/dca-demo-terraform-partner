# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_4_1_2_3 < CISRemediation
  def initialize
    super('CIS_RHEL8_4_1_2_3')
    @title = 'Ensure system is disabled when audit logs are full (Scored)'
    @scored = true
    @level = 2
    @identifier = '4.1.2.3'
    @description = '
    "4.1.2.3 Ensure system is disabled when audit logs are full (Scored)\nProfile Applicability:\n Level 2 - Server\n Level 2 - Workstation\nDescription:\nThe auditd daemon can be configured to halt the system when the audit logs are full.\nRationale:\nIn high security contexts, the risk of detecting unauthorized access or nonrepudiation exceeds the benefit of the systems availability.\nAudit:\nRun the following commands and verify output matches:\n      # grep space_left_action /etc/audit/auditd.conf space_left_action = email\n# grep action_mail_acct /etc/audit/auditd.conf action_mail_acct = root\n# grep admin_space_left_action /etc/audit/auditd.conf admin_space_left_action = halt\n                   Remediation:\nSet the following parameters in /etc/audit/auditd.conf:\n      space_left_action = email\naction_mail_acct = root\n     admin_space_left_action = halt\n\n"
    '
    @script_file = 'CIS_RHEL8_4_1_2_3.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_4_1_2_3.sh"}]
  end
end
