# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_3_4_4_1_3 < CISRemediation
  def initialize
    super('CIS_RHEL8_3_4_4_1_3')
    @title = 'Ensure outbound and established connections are configured (Not Scored)'
    @scored = false
    @level = 1
    @identifier = '3.4.4.1.3'
    @description = '
    "3.4.4.1.3 Ensure outbound and established connections are configured (Not Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nConfigure the firewall rules for new outbound, and established connections.\nRationale:\nIf rules are not in place for new outbound, and established connections all packets will be dropped by the default policy preventing network usage.\nAudit:\nRun the following command and verify all rules for new outbound, and established connections match site policy:\n# iptables -L -v -n\n\nRemediation:\nConfigure iptables in accordance with site policy. The following commands will implement a policy to allow all outbound connections and all established connections:\nNotes:\nChanging firewall settings while connected over network can result in being locked out of the system.\nRemediation will only affect the active system firewall, be sure to configure the default policy in your firewall management to apply on boot as well.\nCIS Controls:\nVersion 7\n9.4 Apply Host-based Firewalls or Port Filtering\nApply host-based firewalls or port filtering tools on end systems, with a default-deny rule that drops all traffic except those services and ports that are explicitly allowed.\n      # iptables -A OUTPUT -p tcp -m state --state NEW,ESTABLISHED -j ACCEPT # iptables -A OUTPUT -p udp -m state --state NEW,ESTABLISHED -j ACCEPT # iptables -A OUTPUT -p icmp -m state --state NEW,ESTABLISHED -j \nACCEPT # iptables -A INPUT -p tcp -m state --state ESTABLISHED -j ACCEPT\n# iptables -A INPUT -p udp -m state --state ESTABLISHED -j ACCEPT # iptables -A INPUT -p icmp -m state --state ESTABLISHED -j ACCEPT\n\n"
    '
    @script_file = ''
    @commands = [{"local"=>"echo 'Automated remediation unavailable. Please remediate manually:\n\nConfigure iptables in accordance with site policy. The following commands will implement a policy to allow all outbound connections and all established connections:\n# iptables -A OUTPUT -p tcp -m state --state NEW,ESTABLISHED -j ACCEPT\n# iptables -A OUTPUT -p udp -m state --state NEW,ESTABLISHED -j ACCEPT\n# iptables -A OUTPUT -p icmp -m state --state NEW,ESTABLISHED -j ACCEPT\n# iptables -A INPUT -p tcp -m state --state ESTABLISHED -j ACCEPT\n# iptables -A INPUT -p udp -m state --state ESTABLISHED -j ACCEPT\n# iptables -A INPUT -p icmp -m state --state ESTABLISHED -j ACCEPT'\n"}]
  end
end
