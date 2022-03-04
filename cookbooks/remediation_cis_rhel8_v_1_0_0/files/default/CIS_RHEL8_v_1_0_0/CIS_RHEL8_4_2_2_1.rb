# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_4_2_2_1 < CISRemediation
  def initialize
    super('CIS_RHEL8_4_2_2_1')
    @title = 'Ensure journald is configured to send logs to rsyslog (Scored)'
    @scored = true
    @level = 1
    @identifier = '4.2.2.1'
    @description = '
    "4.2.2.1 Ensure journald is configured to send logs to rsyslog (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nData from journald may be stored in volatile memory or persisted locally on the server. Utilities exist to accept remote export of journald logs, however, use of the rsyslog service provides a consistent means of log \ncollection and export.\nRationale:\nStoring log data on a remote host protects log integrity from local attacks. If an attacker gains root access on the local system, they could tamper with or remove log data that is stored on the local system.\nAudit:\nReview /etc/systemd/journald.conf and verify that logs are forwarded to syslog\n      # grep -e ^\s*ForwardToSyslog /etc/systemd/journald.conf ForwardToSyslog=yes\n\nRemediation:\nEdit the /etc/systemd/journald.conf file and add the following line: ForwardToSyslog=yes\nReferences:\n1. https://github.com/konstruktoid/hardening/blob/master/systemd.adoc#etcsyste mdjournaldconf\nNotes:\nThis recommendation assumes that recommendation 4.2.1.5, \"Ensure rsyslog is configured to send logs to a remote log host\" has been implemented.\nAs noted in the journald man pages, journald logs may be exported to rsyslog either through the process mentioned here, or through a facility like systemd-journald.service. There are trade-offs involved in each \nimplementation, where ForwardToSyslog will immediately capture all events (and forward to an external log server, if properly configured), but may not capture all boot-up activities. Mechanisms such as systemd- \njournald.service, on the other hand, will record bootup events, but may delay sending the information to rsyslog, leading to the potential for log manipulation prior to export. Be aware of the limitations of all \ntools employed to secure a system.\nThe main configuration file /etc/systemd/journald.conf is read before any of the custom *.conf files. If there are custom configs present, they override the main configuration parameters\nCIS Controls:\nVersion 7\n6.5 Central Log Management\nEnsure that appropriate logs are being aggregated to a central log management system for analysis and review.\n\n"
    '
    @script_file = 'CIS_RHEL8_4_2_2_1.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_4_2_2_1.sh"}]
  end
end
