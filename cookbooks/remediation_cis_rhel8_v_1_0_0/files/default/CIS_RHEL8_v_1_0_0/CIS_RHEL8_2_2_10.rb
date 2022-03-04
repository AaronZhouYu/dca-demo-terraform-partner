# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_2_2_10 < CISRemediation
  def initialize
    super('CIS_RHEL8_2_2_10')
    @title = 'Ensure FTP Server is not enabled (Scored)'
    @scored = true
    @level = 1
    @identifier = '2.2.10'
    @description = '
    "2.2.10 Ensure FTP Server is not enabled (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nThe File Transfer Protocol (FTP) provides networked computers with the ability to transfer files.\nRationale:\nFTP does not protect the confidentiality of data or authentication credentials. It is recommended SFTP be used if file transfer is required. Unless there is a need to run the system as a FTP server (for example, to \nallow anonymous downloads), it is recommended that the package be deleted to reduce the potential attack surface.\nAudit:\nRun the following command to verify vsftpd is not enabled:\nVerify result is not \"enabled\".\n      # systemctl is-enabled vsftpd\ndisabled\n\nRemediation:\nRun the following command to disable vsftpd :\n# systemctl --now disable vsftpd\nNotes:\nAdditional methods of disabling a service exist. Consult your distribution documentation for appropriate methods.\nAdditional FTP servers also exist and should be audited.\nCIS Controls:\nVersion 7\n9.2 Ensure Only Approved Ports, Protocols and Services Are Running\nEnsure that only network ports, protocols, and services listening on a system with validated business needs, are running on each system.\n\n"
    '
    @script_file = 'CIS_RHEL8_2_2_10.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_2_2_10.sh"}]
  end
end
