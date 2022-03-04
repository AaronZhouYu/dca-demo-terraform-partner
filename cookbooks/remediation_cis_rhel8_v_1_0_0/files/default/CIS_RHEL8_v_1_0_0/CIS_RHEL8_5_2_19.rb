# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_5_2_19 < CISRemediation
  def initialize
    super('CIS_RHEL8_5_2_19')
    @title = 'Ensure SSH MaxSessions is set to 4 or less (Scored)'
    @scored = true
    @level = 1
    @identifier = '5.2.19'
    @description = '
    "5.2.19 Ensure SSH MaxSessions is set to 4 or less (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nThe MaxSessions parameter specifies the maximum number of open sessions permitted from a given connection.\nRationale:\nTo protect a system from denial of service due to a large number of concurrent sessions, use the rate limiting function of MaxSessions to protect availability of sshd logins and prevent overwhelming the daemon.\nAudit:\nRun the following command and verify that output MaxSessions is 4 or less, or matches site policy:\nRemediation:\nEdit the /etc/ssh/sshd_config file to set the parameter as follows: MaxSessions 4\nCIS Controls:\nVersion 7\n5.1 Establish Secure Configurations\nMaintain documented, standard security configuration standards for all authorized operating systems and software.\n      # sshd -T | grep -i maxsessions\n# maxsessions 4\n\n"
    '
    @script_file = 'CIS_RHEL8_5_2_19.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_5_2_19.sh"}]
  end
end
