# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_2_2_8 < CISRemediation
  def initialize
    super('CIS_RHEL8_2_2_8')
    @title = 'Ensure IMAP and POP3 server is not enabled (Scored)'
    @scored = true
    @level = 1
    @identifier = '2.2.8'
    @description = '
    "2.2.8 Ensure IMAP and POP3 server is not enabled (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\ndovecot is an open source IMAP and POP3 server for Linux based systems.\nRationale:\nUnless POP3 and/or IMAP servers are to be provided by this system, it is recommended that the service be deleted to reduce the potential attack surface.\nAudit:\nRun the following command to verify dovecot is not enabled:\nVerify result is not \"enabled\".\n      # systemctl is-enabled dovecot\ndisabled\n\nRemediation:\nRun the following command to disable dovecot :\n# systemctl --now disable dovecot\nNotes:\nAdditional methods of disabling a service exist. Consult your distribution documentation for appropriate methods.\nSeveral IMAP/POP3 servers exist and can use other service names. courier-imap and cyrus-imap are example services that provide a mail server. These and other services should also be audited.\nCIS Controls:\nVersion 7\n9.2 Ensure Only Approved Ports, Protocols and Services Are Running\nEnsure that only network ports, protocols, and services listening on a system with validated business needs, are running on each system.\n\n"
    '
    @script_file = 'CIS_RHEL8_2_2_8.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_2_2_8.sh"}]
  end
end
