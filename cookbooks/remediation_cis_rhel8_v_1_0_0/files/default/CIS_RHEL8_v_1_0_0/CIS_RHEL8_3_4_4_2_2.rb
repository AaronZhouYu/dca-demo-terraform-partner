# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_3_4_4_2_2 < CISRemediation
  def initialize
    super('CIS_RHEL8_3_4_4_2_2')
    @title = 'Ensure IPv6 loopback traffic is configured (Scored)'
    @scored = true
    @level = 1
    @identifier = '3.4.4.2.2'
    @description = '
    "3.4.4.2.2 Ensure IPv6 loopback traffic is configured (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nConfigure the loopback interface to accept traffic. Configure all other interfaces to deny traffic to the loopback network (::1).\nRationale:\nLoopback traffic is generated between processes on machine and is typically critical to operation of the system. The loopback interface is the only place that loopback network (::1) traffic should be seen, all other \ninterfaces should ignore traffic on this network as an anti-spoofing measure.\nAudit:\nIf IPv6 is enabled on the system\nRun the following commands and verify output includes the listed rules in order (packet and byte counts may differ):\n      # ip6tables -L INPUT -v -n\nChain INPUT (policy DROP 0 packets, 0 bytes)\npkts bytes target     prot opt in     out     source\ndestination\n00 ACCEPT all lo * ::/0 ::/0 00 DROP all * * ::1 ::/0\n# ip6tables -L OUTPUT -v -n\nChain OUTPUT (policy DROP 0 packets, 0 bytes)\npkts bytes target     prot opt in     out     source\ndestination\n                         0 0 ACCEPT all * lo ::/0 ::/0\n\nRemediation:\nRun the following commands to implement the loopback rules:\nNotes:\nChanging firewall settings while connected over network can result in being locked out of the system.\nRemediation will only affect the active system firewall, be sure to configure the default policy in your firewall management to apply on boot as well.\nCIS Controls:\nVersion 7\n9.4 Apply Host-based Firewalls or Port Filtering\nApply host-based firewalls or port filtering tools on end systems, with a default-deny rule that drops all traffic except those services and ports that are explicitly allowed.\n      # ip6tables -A INPUT -i lo -j ACCEPT\n# ip6tables -A OUTPUT -o lo -j ACCEPT\n# ip6tables -A INPUT -s ::1 -j DROP\n\n"
    '
    @script_file = 'CIS_RHEL8_3_4_4_2_2.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_3_4_4_2_2.sh"}]
  end
end
