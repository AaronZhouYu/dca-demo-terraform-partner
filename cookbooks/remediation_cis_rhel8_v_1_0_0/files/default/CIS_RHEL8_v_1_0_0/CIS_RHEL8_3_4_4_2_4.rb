# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_3_4_4_2_4 < CISRemediation
  def initialize
    super('CIS_RHEL8_3_4_4_2_4')
    @title = 'Ensure IPv6 firewall rules exist for all open ports (Not Scored)'
    @scored = false
    @level = 1
    @identifier = '3.4.4.2.4'
    @description = '
    "3.4.4.2.4 Ensure IPv6 firewall rules exist for all open ports (Not Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nAny ports that have been opened on non-loopback addresses need firewall rules to govern traffic.\nRationale:\nWithout a firewall rule configured for open ports default firewall policy will drop all packets to these ports.\n\nAudit:\nIf IPv6 is enabled on the system\nRun the following command to determine open ports:\n      # ss -6tuln\nNetid  State\nAddress:Port\nudp    UNCONN\n:::*\nudp    UNCONN\n:::*\ntcp    LISTEN\nRecv-Q Send-Q\n0      0\n0      0\n0      128\nLocal Address:Port                   Peer\n          ::1:123\n:::123 :::22\n                   :::*\ntcp    LISTEN     0      20                  ::1:25\n:::*\n       Run the following command to determine firewall rules:\n      # ip6tables -L INPUT -v -n\nChain INPUT (policy DROP 0 packets, 0 bytes)\n       pkts bytes target\ndestination\nprot opt in\nall      lo\nall      *\ntcp      *\nout source\n* ::/0 ::/0\n* ::1 ::/0\n* ::/0 ::/0\n    0 0 0 0 0 0\nACCEPT\nDROP\nACCEPT\n      tcp dpt:22 state NEW\n   Verify all open ports listening on non-localhost addresses have at least one firewall rule. The last line identified by the \"tcp dpt:22 state NEW\" identifies it as a firewall rule for new connections on tcp port \n22.\n\nRemediation:\nFor each port identified in the audit which does not have a firewall rule establish a proper rule for accepting inbound connections:\nNotes:\nChanging firewall settings while connected over network can result in being locked out of the system.\nRemediation will only affect the active system firewall, be sure to configure the default policy in your firewall management to apply on boot as well.\nThe remediation command opens up the port to traffic from all sources. Consult iptables documentation and set any restrictions in compliance with site policy.\nCIS Controls:\nVersion 7\n9.4 Apply Host-based Firewalls or Port Filtering\nApply host-based firewalls or port filtering tools on end systems, with a default-deny rule that drops all traffic except those services and ports that are explicitly allowed.\n      # ip6tables -A INPUT -p <protocol> --dport <port> -m state --state NEW -j ACCEPT\n\n"
    '
    @script_file = ''
    @commands = [{"local"=>"echo 'Automated remediation unavailable. Please remediate manually:\n\nFor each port identified in the audit which does not have a firewall rule establish a proper rule for accepting inbound connections:\n# ip6tables -A INPUT -p <protocol> --dport <port> -m state --state NEW -j ACCEPT'\n"}]
  end
end
