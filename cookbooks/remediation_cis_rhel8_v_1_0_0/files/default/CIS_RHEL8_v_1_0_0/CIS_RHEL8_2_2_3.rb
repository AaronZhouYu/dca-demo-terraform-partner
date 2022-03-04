# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_2_2_3 < CISRemediation
  def initialize
    super('CIS_RHEL8_2_2_3')
    @title = 'Ensure rsync service is not enabled (Scored)'
    @scored = true
    @level = 1
    @identifier = '2.2.3'
    @description = '
    "2.2.3 Ensure rsync service is not enabled (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nThe rsyncd service can be used to synchronize files between systems over network links.\nRationale:\nThe rsyncd service presents a security risk as it uses unencrypted protocols for communication.\nAudit:\nRun the following command to verify rsyncd is not enabled:\nVerify result is not \"enabled\"\n      # systemctl is-enabled rsyncd\ndisabled\n\nRemediation:\nRun the following command to disable rsyncd:\n# systemctl --now disable rsyncd\nNotes:\nAdditional methods of disabling a service exist. Consult your distribution documentation for appropriate methods.\nOn some distributions the rsync service is known as rsync, not rsyncd.\nCIS Controls:\nVersion 7\n9.2 Ensure Only Approved Ports, Protocols and Services Are Running\nEnsure that only network ports, protocols, and services listening on a system with validated business needs, are running on each system.\n\n"
    '
    @script_file = 'CIS_RHEL8_2_2_3.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_2_2_3.sh"}]
  end
end
