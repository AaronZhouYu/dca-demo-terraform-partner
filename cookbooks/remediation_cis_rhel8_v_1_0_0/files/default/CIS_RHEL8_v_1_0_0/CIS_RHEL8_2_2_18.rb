# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_2_2_18 < CISRemediation
  def initialize
    super('CIS_RHEL8_2_2_18')
    @title = 'Ensure mail transfer agent is configured for local-only mode (Scored)'
    @scored = true
    @level = 1
    @identifier = '2.2.18'
    @description = '
    "2.2.18 Ensure mail transfer agent is configured for local-only mode (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nMail Transfer Agents (MTA), such as sendmail and Postfix, are used to listen for incoming mail and transfer the messages to the appropriate user or mail server. If the system is not intended to be a mail server, it \nis recommended that the MTA be configured to only process local mail.\nRationale:\nThe software for all Mail Transfer Agents is complex and most have a long history of security issues. While it is important to ensure that the system can process local mail messages, it is not necessary to have the \nMTAs daemon listening on a port unless the server is intended to be a mail server that receives and processes mail from other systems.\nAudit:\nRun the following command to verify that the MTA is not listening on any non-loopback address ( 127.0.0.1 or ::1 )\nNothing should be returned\n# ss -lntu | grep -E :25\s | grep -E -v \s(127.0.0.1|::1):25\s\n\nRemediation:\nEdit /etc/postfix/main.cf and add the following line to the RECEIVING MAIL section. If the line already exists, change it to look like the line below:\ninet_interfaces = loopback-only\nRun the following command to restart postfix # systemctl restart postfix\nNotes:\nThis recommendation is designed around the postfix mail server, depending on your environment you may have an alternative MTA installed such as sendmail. If this is the case consult the documentation for your \ninstalled MTA to configure the recommended state.\nCIS Controls:\nVersion 7\n9.2 Ensure Only Approved Ports, Protocols and Services Are Running\nEnsure that only network ports, protocols, and services listening on a system with validated business needs, are running on each system.\n\n"
    '
    @script_file = 'CIS_RHEL8_2_2_18.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_2_2_18.sh"}]
  end
end
