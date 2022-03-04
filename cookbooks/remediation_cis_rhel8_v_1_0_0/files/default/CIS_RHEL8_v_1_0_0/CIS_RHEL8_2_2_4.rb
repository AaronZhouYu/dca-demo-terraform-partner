# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_2_2_4 < CISRemediation
  def initialize
    super('CIS_RHEL8_2_2_4')
    @title = 'Ensure Avahi Server is not enabled (Scored)'
    @scored = true
    @level = 1
    @identifier = '2.2.4'
    @description = '
    "2.2.4 Ensure Avahi Server is not enabled (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nAvahi is a free zeroconf implementation, including a system for multicast DNS/DNS-SD service discovery. Avahi allows programs to publish and discover services and hosts running on a local network with no specific \nconfiguration. For example, a user can plug a computer into a network and Avahi automatically finds printers to print to, files to look at and people to talk to, as well as network services running on the machine.\nRationale:\nAutomatic discovery of network services is not normally required for system functionality. It is recommended to disable the service to reduce the potential attack surface.\nAudit:\nRun the following command to verify the avahi-daemon is not enabled:\nVerify result is not \"enabled\".\n      # systemctl is-enabled avahi-daemon\ndisabled\n\nRemediation:\nRun the following command to disable avahi-daemon:\n# systemctl --now disable avahi-daemon\nNotes:\nAdditional methods of disabling a service exist. Consult your distribution documentation for appropriate methods.\nCIS Controls:\nVersion 7\n9.2 Ensure Only Approved Ports, Protocols and Services Are Running\nEnsure that only network ports, protocols, and services listening on a system with validated business needs, are running on each system.\n\n"
    '
    @script_file = 'CIS_RHEL8_2_2_4.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_2_2_4.sh"}]
  end
end
