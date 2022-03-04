# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_3_4_3_5 < CISRemediation
  def initialize
    super('CIS_RHEL8_3_4_3_5')
    @title = 'Ensure outbound and established connections are configured (Not Scored)'
    @scored = false
    @level = 1
    @identifier = '3.4.3.5'
    @description = '
    "3.4.3.5 Ensure outbound and established connections are configured (Not Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nConfigure the firewall rules for new outbound, and established connections\nRationale:\nIf rules are not in place for new outbound, and established connections all packets will be dropped by the default policy preventing network usage.\nAudit:\nRun the following commands and verify all rules for established incoming connections match site policy: site policy:\nOutput should be similar to:\nRun the folllowing command and verify all rules for new and established outbound connections match site policy\nOutput should be similar to:\n      # nft list ruleset | awk /hook input/,/}/ | grep -E ip protocol (tcp|udp|icmp) ct state\n           ip protocol tcp ct state established accept\nip protocol udp ct state established accept\nip protocol icmp ct state established accept\n             # nft list ruleset | awk /hook output/,/}/ | grep -E ip protocol (tcp|udp|icmp) ct state\n           ip protocol tcp ct state established,related,new accept ip protocol udp ct state established,related,new accept ip protocol icmp ct state established,related,new accept\n\nRemediation:\nConfigure nftables in accordance with site policy. The following commands will implement a policy to allow all outbound connections and all established connections:\n      # nft add rule inet filter input ip protocol tcp ct state established accept # nft add rule inet filter input ip protocol udp ct state established accept # nft add rule inet filter input ip protocol icmp ct \nstate established accept\n# nft add rule inet filter output ip protocol tcp ct state new,related,established accept\n                   # nft add rule inet filter output ip protocol udp ct state new,related,established accept\n# nft add rule inet filter output ip protocol icmp ct state new,related,established accept\n           CIS Controls:\nVersion 7\n9.4 Apply Host-based Firewalls or Port Filtering\nApply host-based firewalls or port filtering tools on end systems, with a default-deny rule that drops all traffic except those services and ports that are explicitly allowed.\n\n"
    '
    @script_file = ''
    @commands = [{"local"=>"echo 'Automated remediation unavailable. Please remediate manually:\n\nConfigure nftables in accordance with site policy. The following commands will implement a policy to allow all outbound connections and all established connections:\n# nft add rule inet filter input ip protocol tcp ct state established accept\n# nft add rule inet filter input ip protocol udp ct state established accept\n# nft add rule inet filter input ip protocol icmp ct state established accept\n# nft add rule inet filter output ip protocol tcp ct state new,related,established accept\n# nft add rule inet filter output ip protocol udp ct state new,related,established accept\n# nft add rule inet filter output ip protocol icmp ct state new,related,established accept'\n"}]
  end
end
