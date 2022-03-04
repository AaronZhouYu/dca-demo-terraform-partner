# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_2_2_5 < CISRemediation
  def initialize
    super('CIS_RHEL8_2_2_5')
    @title = 'Ensure SNMP Server is not enabled (Scored)'
    @scored = true
    @level = 1
    @identifier = '2.2.5'
    @description = '
    "2.2.5 Ensure SNMP Server is not enabled (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nThe Simple Network Management Protocol (SNMP) server is used to listen for SNMP commands from an SNMP management system, execute the commands or collect the information and then send results back to the requesting \nsystem.\nRationale:\nThe SNMP server can communicate using SNMP v1, which transmits data in the clear and does not require authentication to execute commands. Unless absolutely necessary, it is recommended that the SNMP service not be \nused. If SNMP is required the server should be configured to disallow SNMP v1.\nAudit:\nRun the following command to verify snmpd is not enabled:\nVerify result is not \"enabled\"\n      # systemctl is-enabled snmpd\ndisabled\n\nRemediation:\nRun the following command to disable snmpd:\n# systemctl --now disable snmpd\nNotes:\nAdditional methods of disabling a service exist. Consult your distribution documentation for appropriate methods.\nCIS Controls:\nVersion 7\n9.2 Ensure Only Approved Ports, Protocols and Services Are Running\nEnsure that only network ports, protocols, and services listening on a system with validated business needs, are running on each system.\n\n"
    '
    @script_file = 'CIS_RHEL8_2_2_5.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_2_2_5.sh"}]
  end
end
