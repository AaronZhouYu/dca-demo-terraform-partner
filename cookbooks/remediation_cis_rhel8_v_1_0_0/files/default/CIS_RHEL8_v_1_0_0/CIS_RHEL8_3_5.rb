# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_3_5 < CISRemediation
  def initialize
    super('CIS_RHEL8_3_5')
    @title = 'Ensure wireless interfaces are disabled (Scored)'
    @scored = true
    @level = 2
    @identifier = '3.5'
    @description = '
    "3.5 Ensure wireless interfaces are disabled (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 2 - Workstation\nDescription:\nWireless networking is used when wired networks are unavailable. Red Hat Enterprise Linux contains a wireless tool kit to allow system administrators to configure and use wireless networks.\nRationale:\nIf wireless is not to be used, wireless devices can be disabled to reduce the potential attack surface.\nAudit:\nRun the following command to verify no wireless interfaces are active on the system:\n#  nmcli radio all\nOutput should look like:\n               WIFI-HW  WIFI      WWAN-HW  WWAN\nenabled  disabled  enabled  disabled\n\nRemediation:\nRun the following command to disable any wireless interfaces:\n# nmcli radio all off\nDisable any wireless interfaces in your network configuration.\nImpact:\nMany if not all laptop workstations and some desktop workstations will connect via wireless requiring these interfaces be enabled.\nReferences:\n1. nmcli(1) - Linux man page\nCIS Controls:\nVersion 7\n15.4 Disable Wireless Access on Devices if Not Required\nDisable wireless access on devices that do not have a business purpose for wireless access.\n15.5 Limit Wireless Access on Client Devices\nConfigure wireless access on client machines that do have an essential wireless business purpose, to allow access only to authorized wireless networks and to restrict access to other wireless networks.\n\n"
    '
    @script_file = ''
    @commands = [{"local"=>"echo 'Automated remediation unavailable. Please remediate manually:\n\nRun the following command to disable any wireless interfaces:\n# nmcli radio all off\nDisable any wireless interfaces in your network configuration.'\n"}]
  end
end
