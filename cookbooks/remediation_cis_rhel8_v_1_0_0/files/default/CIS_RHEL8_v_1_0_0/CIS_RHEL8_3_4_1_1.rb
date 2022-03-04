# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_3_4_1_1 < CISRemediation
  def initialize
    super('CIS_RHEL8_3_4_1_1')
    @title = 'Ensure a Firewall package is installed (Scored)'
    @scored = true
    @level = 1
    @identifier = '3.4.1.1'
    @description = '
    "3.4.1.1 Ensure a Firewall package is installed (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nA Firewall package should be selected. Most firewall configuration utilities operate as a front end to nftables or iptables.\nRationale:\nA Firewall package is required for firewall management and configuration.\nAudit:\nRun one of the following commands to verify the Firewall package is installed:\nFor firewalld:\n# rpm -q firewalld\nFor nftables:\n# rpm -q nftables\nFor iptables:\n# rpm -q iptables\n\nRemediation:\nRun one of the following commands to install a Firewall package.\nFor firewalld:\n# dnf install firewalld\nFor nftables:\n# dnf install nftables\nFor iptables:\n# dnf install iptables\nCIS Controls:\nVersion 7\n9.4 Apply Host-based Firewalls or Port Filtering\nApply host-based firewalls or port filtering tools on end systems, with a default-deny rule that drops all traffic except those services and ports that are explicitly allowed.\n\n"
    '
    @script_file = 'CIS_RHEL8_3_4_1_1.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_3_4_1_1.sh"}]
  end
end
