# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_3_4_4_1_2 < CISRemediation
  def initialize
    super('CIS_RHEL8_3_4_4_1_2')
    @title = 'Ensure loopback traffic is configured (Scored)'
    @scored = true
    @level = 1
    @identifier = '3.4.4.1.2'
    @description = '
    "3.4.4.1.2 Ensure loopback traffic is configured (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nConfigure the loopback interface to accept traffic. Configure all other interfaces to deny traffic to the loopback network (127.0.0.0/8).\nRationale:\nLoopback traffic is generated between processes on machine and is typically critical to operation of the system. The loopback interface is the only place that loopback network (127.0.0.0/8) traffic should be seen, \nall other interfaces should ignore traffic on this network as an anti-spoofing measure.\nAudit:\nRun the following commands and verify output includes the listed rules in order (packet and byte counts may differ):\n      # iptables -L INPUT -v -n\nChain INPUT (policy DROP 0 packets, 0 bytes)\n     pkts bytes target\ndestination\n00 ACCEPT 00 DROP\nprot opt in\nall  --  lo\nall  --  *\nout source\n* 0.0.0.0/0\n*       127.0.0.0/8\n0.0.0.0/0\n0.0.0.0/0\n0.0.0.0/0\n           # iptables -L OUTPUT -v -n\nChain OUTPUT (policy DROP 0 packets, 0 bytes)\n pkts bytes target     prot opt in     out\ndestination\n00 ACCEPT all -- * lo\nsource\n0.0.0.0/0\n\nRemediation:\nRun the following commands to implement the loopback rules:\nNotes:\nChanging firewall settings while connected over network can result in being locked out of the system.\nRemediation will only affect the active system firewall, be sure to configure the default policy in your firewall management to apply on boot as well.\nCIS Controls:\nVersion 7\n9.4 Apply Host-based Firewalls or Port Filtering\nApply host-based firewalls or port filtering tools on end systems, with a default-deny rule that drops all traffic except those services and ports that are explicitly allowed.\n      # iptables -A INPUT -i lo -j ACCEPT\n# iptables -A OUTPUT -o lo -j ACCEPT\n# iptables -A INPUT -s 127.0.0.0/8 -j DROP\n\n"
    '
    @script_file = 'CIS_RHEL8_3_4_4_1_2.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_3_4_4_1_2.sh"}]
  end
end
