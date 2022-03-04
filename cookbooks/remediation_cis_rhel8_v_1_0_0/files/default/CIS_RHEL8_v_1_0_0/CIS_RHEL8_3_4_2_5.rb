# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_3_4_2_5 < CISRemediation
  def initialize
    super('CIS_RHEL8_3_4_2_5')
    @title = 'Ensure network interfaces are assigned to appropriate zone (Not Scored)'
    @scored = false
    @level = 1
    @identifier = '3.4.2.5'
    @description = '
    "3.4.2.5 Ensure network interfaces are assigned to appropriate zone (Not Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nfirewall zones define the trust level of network connections or interfaces.\nRationale:\nA network interface not assigned to the appropriate zone can allow unexpected or undesired network traffic to be accepted on the interface\nAudit:\nRun the following command, and verify that the interface(s) follow site policy for zone assignment\nRemediation:\nRun the following command to assign an interface to the approprate zone.\n# firewall-cmd --zone=<Zone NAME> --change-interface=<INTERFACE NAME>\nExample:\n# firewall-cmd --zone=customezone --change-interface=eth0\nImpact:\nChanging firewall settings while connected over network can result in being locked out of the system.\nDefault Value:\nIf the zone is not set in the configuration file, the interfaces will be assigned to the default zone defined in the firewalld configuration\n      # nmcli -t connection show | awk -F: {if($4){print $4}} | while read INT; do firewall-cmd --get-active-zones | grep -B1 $INT; done\n\nReferences:\n1. https://firewalld.org/documentation/zone/connections-interfaces-and- sources.html\nNotes:\nThe firewall in the Linux kernel is not able to handle network connections with the name shown by NetworkManager, it can only handle the network interfaces used by the connection. Because of this NetworkManager tells \nfirewalld to assign the network interface that is used for this connection to the zone defined in the configuration of that connection. This assignment happens before the interface is used. The configuration of the \nconnection can either be the NetworkManager configuration or also an ifcfg for example. If the zone is not set in the configuration file, the interfaces will be assigned to the default zone defined in the firewalld \nconfiguration. If a connection has more than one interface, all of them will be supplied to firewalld. Also changes in the names of interfaces will be handled by NetworkManager and supplied to firewalld.\nCIS Controls:\nVersion 7\n9.4 Apply Host-based Firewalls or Port Filtering\nApply host-based firewalls or port filtering tools on end systems, with a default-deny rule that drops all traffic except those services and ports that are explicitly allowed.\n\n"
    '
    @script_file = ''
    @commands = [{"local"=>"echo 'Automated remediation unavailable. Please remediate manually:\n\nRun the following command to assign an interface to the approprate zone.\n# firewall-cmd --zone=<Zone NAME> --change-interface=<INTERFACE NAME>\n\nExample:\n# firewall-cmd --zone=customezone --change-interface=eth0'\n"}]
  end
end
