# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_3_4_2_1 < CISRemediation
  def initialize
    super('CIS_RHEL8_3_4_2_1')
    @title = 'Ensure firewalld service is enabled and running (Scored)'
    @scored = true
    @level = 1
    @identifier = '3.4.2.1'
    @description = '
    "3.4.2.1 Ensure firewalld service is enabled and running (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nEnsure that the firewalld service is enabled to protect your system\nRationale:\nfirewalld (Dynamic Firewall Manager) tool provides a dynamically managed firewall. The tool enables network/firewall zones to define the trust level of network connections and/or interfaces. It has support both for \nIPv4 and IPv6 firewall settings. Also, it supports Ethernet bridges and allow you to separate between runtime and permanent configuration options. Finally, it supports an interface for services or applications to add \nfirewall rules directly\nAudit:\nRun the following command to verify that firewalld is enabled:\nRun the following command to verify that firewalld is running\n      # systemctl is-enabled firewalld\nenabled\n             # firewall-cmd --state\nrunning\n\nRemediation:\nRun the following command to enable and start firewalld\n# systemctl --now enable firewalld\nImpact:\nChanging firewall settings while connected over network can result in being locked out of the system.\nCIS Controls:\nVersion 7\n9.4 Apply Host-based Firewalls or Port Filtering\nApply host-based firewalls or port filtering tools on end systems, with a default-deny rule that drops all traffic except those services and ports that are explicitly allowed.\n\n"
    '
    @script_file = 'CIS_RHEL8_3_4_2_1.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_3_4_2_1.sh"}]
  end
end
