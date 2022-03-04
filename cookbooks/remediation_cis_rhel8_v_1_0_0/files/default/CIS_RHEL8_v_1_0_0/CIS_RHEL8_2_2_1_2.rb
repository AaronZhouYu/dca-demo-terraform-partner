# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_2_2_1_2 < CISRemediation
  def initialize
    super('CIS_RHEL8_2_2_1_2')
    @title = 'Ensure chrony is configured (Scored)'
    @scored = true
    @level = 1
    @identifier = '2.2.1.2'
    @description = '
    "2.2.1.2 Ensure chrony is configured (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation Description:\nchrony is a daemon which implements the Network Time Protocol (NTP) is designed to synchronize system clocks across a variety of systems and use a source that is highly accurate. More information on chrony can be \nfound at http://chrony.tuxfamily.org/. chrony can be configured to be a client and/or a server.\nRationale:\nIf chrony is in use on the system proper configuration is vital to ensuring time synchronization is working properly.\nThis recommendation only applies if chrony is in use on the system.\nAudit:\nRun the following command and verify remote server is configured properly:\nMultiple servers may be configured.\nRun the following command and verify the first field for the chronyd process is chrony:\n       # grep -E \"^(server|pool)\" /etc/chrony.conf server <remote-server>\n             # ps -ef | grep chronyd\nchrony 491 1 0 20:32 ? 00:00:00 /usr/sbin/chronyd\n\nRemediation:\nAdd or edit server or pool lines to /etc/chrony.conf as appropriate: server <remote-server>\nConfigure chrony to run as the chrony user\nCIS Controls:\nVersion 7\n6.1 Utilize Three Synchronized Time Sources\nUse at least three synchronized time sources from which all servers and network devices retrieve time information on a regular basis so that timestamps in logs are consistent.\n\n"
    '
    @script_file = 'CIS_RHEL8_2_2_1_2.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_2_2_1_2.sh"}]
  end
end
