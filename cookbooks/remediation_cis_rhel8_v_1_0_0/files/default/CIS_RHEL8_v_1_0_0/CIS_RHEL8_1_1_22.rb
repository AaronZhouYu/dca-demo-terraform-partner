# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_1_1_22 < CISRemediation
  def initialize
    super('CIS_RHEL8_1_1_22')
    @title = 'Disable Automounting (Scored)'
    @scored = true
    @level = 2
    @identifier = '1.1.22'
    @description = '
    "1.1.22 Disable Automounting (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 2 - Workstation\nDescription:\nautofs allows automatic mounting of devices, typically including CD/DVDs and USB drives.\nRationale:\nWith automounting enabled anyone with physical access could attach a USB drive or disc and have its contents available in system even if they lacked permissions to mount it themselves.\nAudit:\nRunthe following command to verify autofs is not enabled:\nVerify result is not \"enabled\".\n      # systemctl is-enabled autofs\ndisabled\n\nRemediation:\nRun the following command to disable autofs: # systemctl --now disable autofs Impact:\nThe use of portable hard drives is very common for workstation users. If your organization allows the use of portable storage or media on workstations and physical access controls to workstations is considered \nadequate there is little value add in turning off automounting.\nNotes:\nAdditional methods of disabling a service exist. Consult your distribution documentation for appropriate methods.\nThis control should align with the tolerance of the use of portable drives and optical media in the organization. On a server requiring an admin to manually mount media can be part of defense-in-depth to reduce the \nrisk of unapproved software or information being introduced or proprietary software or information being exfiltrated. If admins commonly use flash drives and Server access has sufficient physical controls, requiring \nmanual mounting may not increase security.\nCIS Controls:\nVersion 7\n8.4 Configure Anti-Malware Scanning of Removable Devices\nConfigure devices so that they automatically conduct an anti-malware scan of removable media when inserted or connected.\n8.5 Configure Devices Not To Auto-run Content\nConfigure devices to not auto-run content from removable media.\n\n"
    '
    @script_file = 'CIS_RHEL8_1_1_22.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_1_1_22.sh"}]
  end
end
