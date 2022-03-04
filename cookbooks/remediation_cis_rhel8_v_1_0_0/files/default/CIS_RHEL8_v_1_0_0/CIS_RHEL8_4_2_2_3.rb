# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_4_2_2_3 < CISRemediation
  def initialize
    super('CIS_RHEL8_4_2_2_3')
    @title = 'Ensure journald is configured to write logfiles to persistent disk (Scored)'
    @scored = true
    @level = 1
    @identifier = '4.2.2.3'
    @description = '
    "4.2.2.3 Ensure journald is configured to write logfiles to persistent disk (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nData from journald may be stored in volatile memory or persisted locally on the server. Logs in memory will be lost upon a system reboot. By persisting logs to local disk on the server they are protected from loss.\nRationale:\nWriting log data to disk will provide the ability to forensically reconstruct events which may have impacted the operations or security of a system even after a system crash or reboot.\nAudit:\nReview /etc/systemd/journald.conf and verify that logs are persisted to disk:\n      # grep -e ^\s*Storage /etc/systemd/journald.conf Storage=persistent\n\nRemediation:\nEdit the /etc/systemd/journald.conf file and add the following line: Storage=persistent\nReferences:\n1. https://github.com/konstruktoid/hardening/blob/master/systemd.adoc#etcsyste mdjournaldconf\nNotes:\nThe main configuration file /etc/systemd/journald.conf is read before any of the custom *.conf files. If there are custom configs present, they override the main configuration parameters\nCIS Controls:\nVersion 7\n6.2 Activate audit logging\nEnsure that local logging has been enabled on all systems and networking devices.\n6.3 Enable Detailed Logging\nEnable system logging to include detailed information such as an event source, date, user, timestamp, source addresses, destination addresses, and other useful elements.\n\n"
    '
    @script_file = 'CIS_RHEL8_4_2_2_3.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_4_2_2_3.sh"}]
  end
end
