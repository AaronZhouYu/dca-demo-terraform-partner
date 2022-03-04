# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_3_4_2_6 < CISRemediation
  def initialize
    super('CIS_RHEL8_3_4_2_6')
    @title = 'Ensure unnecessary services and ports are not accepted (Not Scored)'
    @scored = false
    @level = 1
    @identifier = '3.4.2.6'
    @description = '
    "3.4.2.6 Ensure unnecessary services and ports are not accepted (Not Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nServices and ports can be accepted or explicitly rejected or dropped by a zone.\nFor every zone, you can set a default behavior that handles incoming traffic that is not further specified. Such behavior is defined by setting the target of the zone. There are three options - default, ACCEPT, \nREJECT, and DROP.\nBy setting the target to ACCEPT, you accept all incoming packets except those disabled by a specific rule.\nIf you set the target to REJECT or DROP, you disable all incoming packets except those that you have allowed in specific rules. When packets are rejected, the source machine is informed about the rejection, while \nthere is no information sent when the packets are dropped.\nRationale:\nTo reduce the attack surface of a system, all services and ports should be blocked unless required\nAudit:\nRun the following command and review output to ensure that listed services and ports follow site policy.\n      # firewall-cmd --get-active-zones | awk !/:/ {print $1} | while read ZN; do firewall-cmd --list-all --zone=$ZN; done\n\nRemediation:\nRun the following command to remove an unnecessary service:\n# firewall-cmd --remove-service=<service>\nExample:\n#firewall-cmd --remove-service=cockpit\nRun the following command to remove an unnecessary port:\n# firewall-cmd --remove-port=<port-number>/<port-type>\nExample:\n# firewall-cmd --remove-port=25/tcp\nRun the following command to make new settings persistent:\n# firewall-cmd --runtime-to-permanent\nReferences:\n1. firewalld.service(5)\n2. https://access.redhat.com/documentation/en-\nus/red_hat_enterprise_linux/8/html/securing_networks/using-and-configuring- firewalls_securing-networks\nCIS Controls:\nVersion 7\n9.4 Apply Host-based Firewalls or Port Filtering\nApply host-based firewalls or port filtering tools on end systems, with a default-deny rule that drops all traffic except those services and ports that are explicitly allowed.\n\n"
    '
    @script_file = ''
    @commands = [{"local"=>"echo 'Automated remediation unavailable. Please remediate manually:\n\nRun the following command to remove an unnecessary service:\n# firewall-cmd --remove-service=<service>\n\nExample:\n#firewall-cmd --remove-service=cockpit\n\nRun the following command to remove an unnecessary port:\n# firewall-cmd --remove-port=<port-number>/<port-type>\n\nExample:\n# firewall-cmd --remove-port=25/tcp\n\nRun the following command to make new settings persistent:\n# firewall-cmd --runtime-to-permanent'\n"}]
  end
end
