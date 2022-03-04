# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_2_2_7 < CISRemediation
  def initialize
    super('CIS_RHEL8_2_2_7')
    @title = 'Ensure Samba is not enabled (Scored)'
    @scored = true
    @level = 1
    @identifier = '2.2.7'
    @description = '
    "2.2.7 Ensure Samba is not enabled (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nThe Samba daemon allows system administrators to configure their Linux systems to share file systems and directories with Windows desktops. Samba will advertise the file systems and directories via the Server Message \nBlock (SMB) protocol. Windows desktop users will be able to mount these directories and file systems as letter drives on their systems.\nRationale:\nIf there is no need to mount directories and file systems to Windows systems, then this service can be deleted to reduce the potential attack surface.\nAudit:\nRun the following command to verify smb is not enabled:\nVerify result is not \"enabled\".\nRemediation:\nRun the following command to disable smb: # systemctl --now disable smb\nCIS Controls:\nVersion 7\n9.2 Ensure Only Approved Ports, Protocols and Services Are Running\nEnsure that only network ports, protocols, and services listening on a system with validated business needs, are running on each system.\n      # systemctl is-enabled smb\ndisabled\n\n"
    '
    @script_file = 'CIS_RHEL8_2_2_7.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_2_2_7.sh"}]
  end
end
