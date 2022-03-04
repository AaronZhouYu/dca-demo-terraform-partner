# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_3_4_3_1 < CISRemediation
  def initialize
    super('CIS_RHEL8_3_4_3_1')
    @title = 'Ensure iptables are flushed (Not Scored)'
    @scored = false
    @level = 1
    @identifier = '3.4.3.1'
    @description = '
    "3.4.3.1 Ensure iptables are flushed (Not Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nnftables is a replacement for iptables, ip6tables, ebtables and arptables\nRationale:\nIt is possible to mix iptables and nftables. However, this increases complexity and also the chance to introduce errors. For simplicity flush out all iptables rules, and ensure it is not loaded\nAudit:\nRun the following commands to ensure not iptables rules exist For iptables:\n# iptables -L\nNo rules shoulb be returned For ip6tables:\n# ip6tables -L\nNo rules should be returned\n\nRemediation:\nRun the following commands to flush iptables: For iptables:\n# iptables -F\nFor ip6tables\n# ip6tables -F\nCIS Controls:\nVersion 7\n9.4 Apply Host-based Firewalls or Port Filtering\nApply host-based firewalls or port filtering tools on end systems, with a default-deny rule that drops all traffic except those services and ports that are explicitly allowed.\n\n"
    '
    @script_file = 'CIS_RHEL8_3_4_3_1.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_3_4_3_1.sh"}]
  end
end
