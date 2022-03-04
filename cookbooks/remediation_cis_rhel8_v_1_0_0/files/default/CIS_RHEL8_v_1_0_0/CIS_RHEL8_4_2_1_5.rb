# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_4_2_1_5 < CISRemediation
  def initialize
    super('CIS_RHEL8_4_2_1_5')
    @title = 'Ensure rsyslog is configured to send logs to a remote log host (Scored)'
    @scored = true
    @level = 1
    @identifier = '4.2.1.5'
    @description = '
    "4.2.1.5 Ensure rsyslog is configured to send logs to a remote log host (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nThe rsyslog utility supports the ability to send logs it gathers to a remote log host running syslogd(8) or to receive messages from remote hosts, reducing administrative overhead.\nRationale:\nStoring log data on a remote host protects log integrity from local attacks. If an attacker gains root access on the local system, they could tamper with or remove log data that is stored on the local system\nAudit:\nReview the /etc/rsyslog.conf and /etc/rsyslog.d/*.conf files and verify that logs are sent to a central host (where loghost.example.com is the name of your central log host):\n      # grep \"^*.*[^I][^I]*@\" /etc/rsyslog.conf /etc/rsyslog.d/*.conf *.* @@loghost.example.com\n\nRemediation:\nEdit the /etc/rsyslog.conf and /etc/rsyslog.d/*.conf files and add the following line (where loghost.example.com is the name of your central log host).\n*.* @@loghost.example.com\nRun the following command to reload the rsyslogd configuration: # systemctl restart rsyslog\nReferences:\n1. See the rsyslog.conf(5) man page for more information.\nNotes:\nThe double \"at\" sign (@@) directs rsyslogto use TCP to send log messages to the server, which is a more reliable transport mechanism than the default UDP protocol.\nCIS Controls:\nVersion 7\n6.6 Deploy SIEM or Log Analytic tool\nDeploy Security Information and Event Management (SIEM) or log analytic tool for log correlation and analysis.\n6.8 Regularly Tune SIEM\nOn a regular basis, tune your SIEM system to better identify actionable events and decrease event noise.\n\n"
    '
    @script_file = ''
    @commands = [{"local"=>"echo 'Automated remediation unavailable. Please remediate manually:\n\nEdit the /etc/rsyslog.conf and /etc/rsyslog.d/*.conf files and add the following line (where loghost.example.com is the name of your central log host).\n*.* @@loghost.example.com\n\nRun the following command to reload the rsyslogd configuration:\n# systemctl restart rsyslog'\n"}]
  end
end
