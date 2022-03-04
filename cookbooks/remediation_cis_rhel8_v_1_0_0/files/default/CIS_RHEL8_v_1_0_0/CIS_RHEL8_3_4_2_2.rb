# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_3_4_2_2 < CISRemediation
  def initialize
    super('CIS_RHEL8_3_4_2_2')
    @title = 'Ensure iptables is not enabled (Scored)'
    @scored = true
    @level = 1
    @identifier = '3.4.2.2'
    @description = '
    "3.4.2.2 Ensure iptables is not enabled (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nIPtables is an application that allows a system administrator to configure the IPv4 and IPv6 tables, chains and rules provided by the Linux kernel firewall.\nIPtables is installed as a dependency with firewalld.\nRationale:\nRunning firewalld and IPtables concurrently may lead to conflict, therefore IPtables should be stopped and masked when using firewalld.\nAudit:\nRun the following command to verify that iptables is not running:\n# systemctl status iptables\nOutput should include:\nRun the following command to verify that iptables is not enabled:\n# systemctl is-enabled iptables\nOuput should not read enabled\n               Loaded: disabled (/dev/null; bad)\nActive: inactive (dead)\n\nRemediation:\nRun the following command to stop and mask iptables\nsystemctl --now mask iptables\nCIS Controls:\nVersion 7\n9.4 Apply Host-based Firewalls or Port Filtering\nApply host-based firewalls or port filtering tools on end systems, with a default-deny rule that drops all traffic except those services and ports that are explicitly allowed.\n\n"
    '
    @script_file = 'CIS_RHEL8_3_4_2_2.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_3_4_2_2.sh"}]
  end
end
