# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_5_6 < CISRemediation
  def initialize
    super('CIS_RHEL8_5_6')
    @title = 'Ensure root login is restricted to system console (Not Scored)'
    @scored = false
    @level = 1
    @identifier = '5.6'
    @description = '
    "5.6 Ensure root login is restricted to system console (Not Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nThe file /etc/securetty contains a list of valid terminals that may be logged in directly as root.\nRationale:\nSince the system console has special properties to handle emergency situations, it is important to ensure that the console is in a physically secure location and that unauthorized consoles have not been defined.\nAudit:\n# cat /etc/securetty\nRemediation:\nRemove entries for any consoles that are not in a physically secure location.\nCIS Controls:\nVersion 7\n5.1 Establish Secure Configurations\nMaintain documented, standard security configuration standards for all authorized operating systems and software.\n\n"
    '
    @script_file = ''
    @commands = [{"local"=>"echo 'Automated remediation unavailable. Please remediate manually:\n\nRemove entries for any consoles that are not in a physically secure location.'\n"}]
  end
end
