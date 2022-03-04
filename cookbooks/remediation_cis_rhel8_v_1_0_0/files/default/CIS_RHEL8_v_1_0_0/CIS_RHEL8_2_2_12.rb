# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_2_2_12 < CISRemediation
  def initialize
    super('CIS_RHEL8_2_2_12')
    @title = 'Ensure NFS is not enabled (Scored)'
    @scored = true
    @level = 1
    @identifier = '2.2.12'
    @description = '
    "2.2.12 Ensure NFS is not enabled (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nThe Network File System (NFS) is one of the first and most widely distributed file systems in the UNIX environment. It provides the ability for systems to mount file systems of other servers through the network.\nRationale:\nIf the system does not export NFS shares, it is recommended that the NFS be disabled to reduce the remote attack surface.\nAudit:\nRun the following command to verify nfs is not enabled:\nVerify result is not \"enabled\".\n      # systemctl is-enabled nfs\ndisabled\n\nRemediation:\nRun the following commands to disable NFS:\n# systemctl --now disable nfs\nNotes:\nAdditional methods of disabling a service exist. Consult your distribution documentation for appropriate methods.\nCIS Controls:\nVersion 7\n9.2 Ensure Only Approved Ports, Protocols and Services Are Running\nEnsure that only network ports, protocols, and services listening on a system with validated business needs, are running on each system.\n\n"
    '
    @script_file = 'CIS_RHEL8_2_2_12.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_2_2_12.sh"}]
  end
end
