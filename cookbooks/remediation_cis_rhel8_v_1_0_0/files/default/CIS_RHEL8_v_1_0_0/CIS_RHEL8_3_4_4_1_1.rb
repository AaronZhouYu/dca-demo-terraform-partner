# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_3_4_4_1_1 < CISRemediation
  def initialize
    super('CIS_RHEL8_3_4_4_1_1')
    @title = 'Ensure default deny firewall policy (Scored)'
    @scored = true
    @level = 1
    @identifier = '3.4.4.1.1'
    @description = '
    "3.4.4.1.1 Ensure default deny firewall policy (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nA default deny all policy on connections ensures that any unconfigured network usage will be rejected.\nRationale:\nWith a default accept policy the firewall will accept any packet that is not configured to be denied. It is easier to white list acceptable usage than to black list unacceptable usage.\nAudit:\nRun the following command and verify that the policy for the INPUT , OUTPUT , and FORWARD chains is DROP or REJECT :\n      # iptables -L\nChain INPUT (policy DROP)\nChain FORWARD (policy DROP)\nChain OUTPUT (policy DROP)\n\nRemediation:\nRun the following commands to implement a default DROP policy:\nNotes:\nChanging firewall settings while connected over network can result in being locked out of the system.\nRemediation will only affect the active system firewall, be sure to configure the default policy in your firewall management to apply on boot as well.\nCIS Controls:\nVersion 7\n9.4 Apply Host-based Firewalls or Port Filtering\nApply host-based firewalls or port filtering tools on end systems, with a default-deny rule that drops all traffic except those services and ports that are explicitly allowed.\n      # iptables -P INPUT DROP\n# iptables -P OUTPUT DROP\n# iptables -P FORWARD DROP\n\n"
    '
    @script_file = ''
    @commands = [{"local"=>"echo 'Automated remediation unavailable. Please remediate manually:\n\nRun the following commands to implement a default DROP policy:\n# iptables -P INPUT DROP\n# iptables -P OUTPUT DROP\n# iptables -P FORWARD DROP'\n"}]
  end
end
