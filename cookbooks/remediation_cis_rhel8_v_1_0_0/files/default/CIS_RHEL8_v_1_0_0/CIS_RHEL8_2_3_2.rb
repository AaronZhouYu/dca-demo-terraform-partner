# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_2_3_2 < CISRemediation
  def initialize
    super('CIS_RHEL8_2_3_2')
    @title = 'Ensure telnet client is not installed (Scored)'
    @scored = true
    @level = 1
    @identifier = '2.3.2'
    @description = '
    "2.3.2 Ensure telnet client is not installed (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nThe telnet package contains the telnet client, which allows users to start connections to other systems via the telnet protocol.\nRationale:\nThe telnet protocol is insecure and unencrypted. The use of an unencrypted transmission medium could allow an unauthorized user to steal credentials. The ssh package provides an encrypted session and stronger \nsecurity and is included in most Linux distributions.\nAudit:\nVerify telnet is not installed. Run the following command:\n      # rpm -q telnet\npackage telnet is not installed\n\nRemediation:\nRun the folling command to uninstall telnet # dnf remove telnet\nImpact:\nMany insecure service clients are used as troubleshooting tools and in testing environments. Uninstalling them can inhibit capability to test and troubleshoot. If they are required it is advisable to remove the \nclients after use to prevent accidental or intentional misuse.\nCIS Controls:\nVersion 7\n4.5 Use Multifactor Authentication For All Administrative Access\nUse multi-factor authentication and encrypted channels for all administrative account access.\n\n"
    '
    @script_file = 'CIS_RHEL8_2_3_2.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_2_3_2.sh"}]
  end
end
