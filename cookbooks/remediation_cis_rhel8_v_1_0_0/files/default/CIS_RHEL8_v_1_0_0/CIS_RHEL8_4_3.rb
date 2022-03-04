# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_4_3 < CISRemediation
  def initialize
    super('CIS_RHEL8_4_3')
    @title = 'Ensure logrotate is configured (Not Scored)'
    @scored = false
    @level = 1
    @identifier = '4.3'
    @description = '
    "4.3 Ensure logrotate is configured (Not Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nThe system includes the capability of rotating log files regularly to avoid filling up the system with logs or making the logs unmanageably large. The file /etc/logrotate.d/syslog is the configuration file used to \nrotate log files created by syslog or rsyslog.\nRationale:\nBy keeping the log files smaller and more manageable, a system administrator can easily archive these files to another system and spend less time looking through inordinately large log files.\nAudit:\nReview /etc/logrotate.conf and /etc/logrotate.d/* and verify logs are rotated according to site policy.\n\nRemediation:\nEdit /etc/logrotate.conf and /etc/logrotate.d/* to ensure logs are rotated according to site policy.\nNotes:\nIf no maxage setting is set for logrotate a situation can occur where logrotate is interrupted and fails to delete rotated logfiles. It is recommended to set this to a value greater than the longest any log file \nshould exist on your system to ensure that any such logfile is removed but standard rotation settings are not overridden.\nCIS Controls:\nVersion 7\n6.4 Ensure adequate storage for logs\nEnsure that all systems that store logs have adequate storage space for the logs generated.\n\n"
    '
    @script_file = ''
    @commands = [{"local"=>"echo 'Automated remediation unavailable. Please remediate manually:\n\nEdit /etc/logrotate.conf and /etc/logrotate.d/* to ensure logs are rotated according to site policy.'\n"}]
  end
end
