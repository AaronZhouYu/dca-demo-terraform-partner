# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_5_1_1 < CISRemediation
  def initialize
    super('CIS_RHEL8_5_1_1')
    @title = 'Ensure cron daemon is enabled (Scored)'
    @scored = true
    @level = 1
    @identifier = '5.1.1'
    @description = '
    "5.1.1 Ensure cron daemon is enabled (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nThe cron daemon is used to execute batch jobs on the system.\nRationale:\nWhile there may not be user jobs that need to be run on the system, the system does have maintenance jobs that may include security monitoring that have to run, and cron is used to execute them.\nAudit:\nRun the the following command to verify cron is enabled:\nVerify result is \"enabled\".\nRemediation:\nRun the following command to enable cron:\n# systemctl --now enable crond\nNotes:\nAdditional methods of enabling a service exist. Consult your distribution documentation for appropriate methods.\nCIS Controls:\nVersion 7\n5.1 Establish Secure Configurations\nMaintain documented, standard security configuration standards for all authorized operating systems and software.\n      # systemctl is-enabled crond\nenabled\n\n"
    '
    @script_file = 'CIS_RHEL8_5_1_1.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_5_1_1.sh"}]
  end
end
