# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_4_2_1_4 < CISRemediation
  def initialize
    super('CIS_RHEL8_4_2_1_4')
    @title = 'Ensure logging is configured (Not Scored)'
    @scored = false
    @level = 1
    @identifier = '4.2.1.4'
    @description = '
    "4.2.1.4 Ensure logging is configured (Not Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nThe /etc/rsyslog.conf and /etc/rsyslog.d/*.conf files specifies rules for logging and which files are to be used to log certain classes of messages.\nRationale:\nA great deal of important security-related information is sent via rsyslog (e.g., successful and failed su attempts, failed login attempts, root login attempts, etc.).\nAudit:\nReview the contents of the /etc/rsyslog.conf and /etc/rsyslog.d/*.conf files to ensure appropriate logging is set. In addition, run the following command and verify that the log files are logging information:\n# ls -l /var/log/\n\nRemediation:\nEdit the following lines in the /etc/rsyslog.conf and /etc/rsyslog.d/*.conf files as appropriate for your environment:\n      *.emerg\nauth,authpriv.*\nmail.*\nmail.info\nmail.warning\nmail.err\nnews.crit\nnews.err\nnews.notice\n:omusrmsg:*\n /var/log/secure\n-/var/log/mail\n-/var/log/mail.info\n-/var/log/mail.warn\n /var/log/mail.err\n-/var/log/news/news.crit\n-/var/log/news/news.err\n-/var/log/news/news.notice\n                   *.=warning;*.=err\n*.crit\n*.*;mail.none;news.none\nlocal0,local1.*\nlocal2,local3.*\nlocal4,local5.*\nlocal6,local7.*\n-/var/log/warn\n /var/log/warn\n-/var/log/messages\n-/var/log/localmessages\n-/var/log/localmessages\n-/var/log/localmessages\n-/var/log/localmessages\n               Run the following command to reload the rsyslogd configuration: # systemctl restart rsyslog\nReferences:\n1. See the rsyslog.conf(5) man page for more information.\nCIS Controls:\nVersion 7\n6.2 Activate audit logging\nEnsure that local logging has been enabled on all systems and networking devices.\n6.3 Enable Detailed Logging\nEnable system logging to include detailed information such as an event source, date, user, timestamp, source addresses, destination addresses, and other useful elements.\n\n"
    '
    @script_file = ''
    @commands = [{"local"=>"echo 'Automated remediation unavailable. Please remediate manually:\n\nEdit the following lines in the /etc/rsyslog.conf and /etc/rsyslog.d/*.conf files as appropriate for your environment:\n*.emerg                                  :omusrmsg:*\nauth,authpriv.*                          /var/log/secure\nmail.*                                  -/var/log/mail\nmail.info                               -/var/log/mail.info\nmail.warning                            -/var/log/mail.warn\nmail.err                                 /var/log/mail.err\nnews.crit                               -/var/log/news/news.crit\nnews.err                                -/var/log/news/news.err\nnews.notice                             -/var/log/news/news.notice\n*.=warning;*.=err                       -/var/log/warn\n*.crit                                   /var/log/warn\n*.*;mail.none;news.none                 -/var/log/messages\nlocal0,local1.*                         -/var/log/localmessages\nlocal2,local3.*                         -/var/log/localmessages\nlocal4,local5.*                         -/var/log/localmessages\nlocal6,local7.*                         -/var/log/localmessages\n\nRun the following command to reload the rsyslogd configuration:\n# systemctl restart rsyslog'\n"}]
  end
end
