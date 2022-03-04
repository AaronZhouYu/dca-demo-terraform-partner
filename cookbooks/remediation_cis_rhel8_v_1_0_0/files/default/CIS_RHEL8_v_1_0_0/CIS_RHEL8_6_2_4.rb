# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_6_2_4 < CISRemediation
  def initialize
    super('CIS_RHEL8_6_2_4')
    @title = 'Ensure no legacy "+" entries exist in /etc/shadow (Scored)'
    @scored = true
    @level = 1
    @identifier = '6.2.4'
    @description = '
    "6.2.4 Ensure no legacy \"+\" entries exist in /etc/shadow (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nThe character + in various files used to be markers for systems to insert data from NIS maps at a certain point in a system configuration file. These entries are no longer required on most systems, but may exist in \nfiles that have been imported from other platforms.\nRationale:\nThese entries may provide an avenue for attackers to gain privileged access on the system.\nAudit:\nRun the following command and verify that no output is returned:\n# grep ^\+: /etc/shadow\nRemediation:\nRemove any legacy + entries from /etc/shadow if they exist.\nCIS Controls:\nVersion 7\n16.2 Configure Centralized Point of Authentication\nConfigure access for all accounts through as few centralized points of authentication as possible, including network, security, and cloud systems.\n\n"
    '
    @script_file = 'CIS_RHEL8_6_2_4.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_6_2_4.sh"}]
  end
end
