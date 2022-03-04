# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_4_2_1_3 < CISRemediation
  def initialize
    super('CIS_RHEL8_4_2_1_3')
    @title = 'Ensure rsyslog default file permissions configured (Scored)'
    @scored = true
    @level = 1
    @identifier = '4.2.1.3'
    @description = '
    "4.2.1.3 Ensure rsyslog default file permissions configured (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nrsyslog will create logfiles that do not already exist on the system. This setting controls what permissions will be applied to these newly created files.\nRationale:\nIt is important to ensure that log files have the correct permissions to ensure that sensitive data is archived and protected.\nAudit:\nRun the following command and verify that $FileCreateMode is 0640 or more restrictive: # grep ^\$FileCreateMode /etc/rsyslog.conf /etc/rsyslog.d/*.conf\n\nRemediation:\nEdit the /etc/rsyslog.conf and /etc/rsyslog.d/*.conf files and set $FileCreateMode to 0640 or more restrictive:\n$FileCreateMode 0640\nReferences:\n1. See the rsyslog.conf(5) man page for more information.\nNotes:\nYou should also ensure this is not overridden with less restrictive settings in any /etc/rsyslog.d/* conf file.\nCIS Controls:\nVersion 7\n5.1 Establish Secure Configurations\nMaintain documented, standard security configuration standards for all authorized operating systems and software.\n\n"
    '
    @script_file = 'CIS_RHEL8_4_2_1_3.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_4_2_1_3.sh"}]
  end
end
