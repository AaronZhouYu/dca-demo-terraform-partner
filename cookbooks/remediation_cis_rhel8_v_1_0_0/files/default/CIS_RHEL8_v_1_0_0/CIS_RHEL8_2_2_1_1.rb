# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_2_2_1_1 < CISRemediation
  def initialize
    super('CIS_RHEL8_2_2_1_1')
    @title = 'Ensure time synchronization is in use (Not Scored)'
    @scored = false
    @level = 1
    @identifier = '2.2.1.1'
    @description = '
    "2.2.1.1 Ensure time synchronization is in use (Not Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nSystem time should be synchronized between all systems in an environment. This is typically done by establishing an authoritative time server or set of servers and having all systems synchronize their clocks to them.\nRationale:\nTime synchronization is important to support time sensitive security mechanisms like Kerberos and also ensures log files have consistent time records across the enterprise, which aids in forensic investigations.\nAudit:\nOn physical systems or virtual systems where host based time synchronization is not available verify that chrony is installed.\nRun the following command to verify that chrony is installed\nOn virtual systems where host based time synchronization is available consult your virtualization software documentation and verify that host based synchronization is in use.\n      # rpm -q chrony\nchrony-<VERSION>\n\nRemediation:\nOn physical systems or virtual systems where host based time synchronization is not available install chrony:\nRun the folloing command to install chrony:\n# dnf install chrony\nOn virtual systems where host based time synchronization is available consult your virtualization software documentation and setup host based synchronization.\nNotes:\nsystemd-timesyncd is part of systemd. Some versions of systemd have been compiled without systemd-timesycnd. On these distributions, chrony or NTP should be used instead of systemd-timesycnd.\nCIS Controls:\nVersion 7\n6.1 Utilize Three Synchronized Time Sources\nUse at least three synchronized time sources from which all servers and network devices retrieve time information on a regular basis so that timestamps in logs are consistent.\n\n"
    '
    @script_file = 'CIS_RHEL8_2_2_1_1.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_2_2_1_1.sh"}]
  end
end
