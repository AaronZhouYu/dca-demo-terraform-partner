# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_3_2_5 < CISRemediation
  def initialize
    super('CIS_RHEL8_3_2_5')
    @title = 'Ensure broadcast ICMP requests are ignored (Scored)'
    @scored = true
    @level = 1
    @identifier = '3.2.5'
    @description = '
    "3.2.5 Ensure broadcast ICMP requests are ignored (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nSetting net.ipv4.icmp_echo_ignore_broadcasts to 1 will cause the system to ignore all ICMP echo and timestamp requests to broadcast and multicast addresses.\nRationale:\nAccepting ICMP echo and timestamp requests with broadcast or multicast destinations for your network could be used to trick your host into starting (or participating) in a Smurf attack. A Smurf attack relies on an \nattacker sending large amounts of ICMP broadcast messages with a spoofed source address. All hosts receiving this message and responding would send echo-reply messages back to the spoofed address, which is probably \nnot routable. If many hosts respond to the packets, the amount of traffic on the network could be significantly multiplied.\nAudit:\nRun the following commands and verify output matches:\n      # sysctl net.ipv4.icmp_echo_ignore_broadcasts net.ipv4.icmp_echo_ignore_broadcasts = 1\n# grep -E -s \"^\s*net\.ipv4\.icmp_echo_ignore_broadcasts\s*=\s*0\" /etc/sysctl.conf /etc/sysctl.d/*.conf /usr/lib/sysctl.d/*.conf /run/sysctl.d/*.conf\nNothing should be returned\n\nRemediation:\nRun the following command to restore the default parameters and set the active kernel parameters:\nCIS Controls:\nVersion 7\n5.1 Establish Secure Configurations\nMaintain documented, standard security configuration standards for all authorized operating systems and software.\n      # grep -Els \"^\s*net\.ipv4\.icmp_echo_ignore_broadcasts\s*=\s*0\" /etc/sysctl.conf /etc/sysctl.d/*.conf /usr/lib/sysctl.d/*.conf /run/sysctl.d/*.conf | while read filename; do sed -ri \n\"s/^\s*(net\.ipv4\.icmp_echo_ignore_broadcasts\s*)(=)(\s*\S+\b).*$/# *REMOVED* \1/\" $filename; done; sysctl -w net.icmp_echo_ignore_broadcasts=1; sysctl -w net.ipv4.route.flush=1\n\n"
    '
    @script_file = 'CIS_RHEL8_3_2_5.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_3_2_5.sh"}]
  end
end
