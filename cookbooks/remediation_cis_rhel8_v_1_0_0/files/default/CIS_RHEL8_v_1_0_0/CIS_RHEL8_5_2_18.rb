# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_5_2_18 < CISRemediation
  def initialize
    super('CIS_RHEL8_5_2_18')
    @title = 'Ensure SSH MaxStartups is configured (Scored)'
    @scored = true
    @level = 1
    @identifier = '5.2.18'
    @description = '
    "5.2.18 Ensure SSH MaxStartups is configured (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nThe MaxStartups parameter specifies the maximum number of concurrent unauthenticated connections to the SSH daemon.\nRationale:\nTo protect a system from denial of service due to a large number of pending authentication connection attempts, use the rate limiting function of MaxStartups to protect availability of sshd logins and prevent \noverwhelming the daemon.\nAudit:\nRun the following command and verify that output MaxStartups is 10:30:60 or matches site policy:\nRemediation:\nEdit the /etc/ssh/sshd_config file to set the parameter as follows: maxstartups 10:30:60\nCIS Controls:\nVersion 7\n5.1 Establish Secure Configurations\nMaintain documented, standard security configuration standards for all authorized operating systems and software.\n      # sshd -T | grep -i maxstartups\n# maxstartups 10:30:60\n\n"
    '
    @script_file = 'CIS_RHEL8_5_2_18.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_5_2_18.sh"}]
  end
end
