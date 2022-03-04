# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_5_3_2 < CISRemediation
  def initialize
    super('CIS_RHEL8_5_3_2')
    @title = 'Select authselect profile (Scored)'
    @scored = true
    @level = 1
    @identifier = '5.3.2'
    @description = '
    "5.3.2 Select authselect profile (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nYou can select a profile for the authselect utility for a specific host. The profile will be applied to every user logging into the host.\nYou can create and deploy a custom profile by customizing one of the default profiles, the sssd, winbind, or the nis profile.\nRationale:\nWhen you deploy a profile, the profile is applied to every user logging into the given host\nAudit:\nRun the following command and verify that the current custom authselect profile follows local site policy:\n#  authselect current\nOutput should be similar to:\n               Profile 5.3.2: <custom-profile name>\nEnabled features:\n- with-sudo\n- with-faillock\n- without-nullok\n\nRemediation:\nRun the following command to select a custom authselect profile\n# authselect select custom/<CUSTOM PROFILE NAME> {with-<OPTIONS>}\nExample:\nReferences:\n1. Using authselect on a Red Hat Enterprise Linux host\nCIS Controls:\nVersion 7\n16 Account Monitoring and Control Account Monitoring and Control\n               # authselect select custom/custom-profile with-sudo with-faillock without- nullok\n\n"
    '
    @script_file = ''
    @commands = [{"local"=>"echo 'Automated remediation unavailable. Please remediate manually:\n\nRun the following command to select a custom authselect profile\n# authselect select custom/<CUSTOM PROFILE NAME> {with-<OPTIONS>}\n\nExample:\n# authselect select custom/custom-profile with-sudo with-faillock without-nullok'\n"}]
  end
end
