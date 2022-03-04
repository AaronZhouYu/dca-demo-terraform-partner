# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_3_4_2_4 < CISRemediation
  def initialize
    super('CIS_RHEL8_3_4_2_4')
    @title = 'Ensure default zone is set (Scored)'
    @scored = true
    @level = 1
    @identifier = '3.4.2.4'
    @description = '
    "3.4.2.4 Ensure default zone is set (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nA firewall zone defines the trust level for a connection, interface or source address binding. This is a one to many relation, which means that a connection, interface or source can only be part of one zone, but a \nzone can be used for many network connections, interfaces and sources.\nThe default zone is the zone that is used for everything that is not explicitely bound/assigned to another zone.\nThat means that if there is no zone assigned to a connection, interface or source, only the default zone is used. The default zone is not always listed as being used for an interface or source as it will be used for \nit either way. This depends on the manager of the interfaces.\nConnections handled by NetworkManager are listed as NetworkManager requests to add the zone binding for the interface used by the connection. Also interfaces under control of the network service are listed also \nbecause the service requests it.\nRationale:\nBecause the default zone is the zone that is used for everything that is not explicitly bound/assigned to another zone, it is important for the default zone to set\nAudit:\nRun the following command and verify that the default zone adheres to company policy:\n# firewall-cmd --get-default-zone\n\nRemediation:\nRun the following command to set the default zone:\n# firewall-cmd --set-default-zone=<NAME_OF_ZONE>\nExample:\n# firewall-cmd --set-default-zone=public\nReferences:\n1. https://firewalld.org/documentation\n2. https://firewalld.org/documentation/man-pages/firewalld.zone\nNotes:\nA firewalld zone configuration file contains the information for a zone. These are the zone description, services, ports, protocols, icmp-blocks, masquerade, forward-ports and rich language rules in an XML file \nformat. The file name has to be zone_name.xml where length of zone_name is currently limited to 17 chars.\nNetworkManager binds interfaces to zones automatically\nCIS Controls:\nVersion 7\n9.4 Apply Host-based Firewalls or Port Filtering\nApply host-based firewalls or port filtering tools on end systems, with a default-deny rule that drops all traffic except those services and ports that are explicitly allowed.\n\n"
    '
    @script_file = ''
    @commands = [{"local"=>"echo 'Automated remediation unavailable. Please remediate manually:\n\nRun the following command to set the default zone:\n# firewall-cmd --set-default-zone=<NAME_OF_ZONE>\n\nExample:\n# firewall-cmd --set-default-zone=public'\n"}]
  end
end
