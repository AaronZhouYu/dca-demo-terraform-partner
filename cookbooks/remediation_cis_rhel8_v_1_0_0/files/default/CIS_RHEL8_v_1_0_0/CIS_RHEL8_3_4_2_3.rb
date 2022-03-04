# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_3_4_2_3 < CISRemediation
  def initialize
    super('CIS_RHEL8_3_4_2_3')
    @title = 'Ensure nftables is not enabled (Scored)'
    @scored = true
    @level = 1
    @identifier = '3.4.2.3'
    @description = '
    "3.4.2.3 Ensure nftables is not enabled (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nnftables is a subsystem of the Linux kernel providing filtering and classification of network packets/datagrams/frames and is the successor to iptables.\nnftables are installed as a dependency with firewalld.\nRationale:\nRunning firewalld and nftables concurrently may lead to conflict, therefore nftables should be stopped and masked when using firewalld.\nAudit:\nRun the following commend to verify that nftables is not enabled:\nRun the following command to verify that iptables is not running:\n# systemctl status nftables\nOutput should include:\n      # systemctl is-enabled nftables\n(disabled|masked)\n                      Loaded: masked (/dev/null; bad)\nActive: inactive (dead)\n\nRemediation:\nRun the following command to mask and stop nftables\nsystemctl --now mask nftables\nNotes:\nfirewalld is dependent on nftables. nftables should be stopped and disabled.\nCIS Controls:\nVersion 7\n9.4 Apply Host-based Firewalls or Port Filtering\nApply host-based firewalls or port filtering tools on end systems, with a default-deny rule that drops all traffic except those services and ports that are explicitly allowed.\n\n"
    '
    @script_file = 'CIS_RHEL8_3_4_2_3.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_3_4_2_3.sh"}]
  end
end
