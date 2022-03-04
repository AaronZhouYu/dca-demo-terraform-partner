# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_5_3_1 < CISRemediation
  def initialize
    super('CIS_RHEL8_5_3_1')
    @title = 'Create custom authselect profile (Scored)'
    @scored = true
    @level = 1
    @identifier = '5.3.1'
    @description = '
    "5.3.1 Create custom authselect profile (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nA custom profile can be created by copying and customizing one of the default profiles. The default profiles include: sssd, winbind, or the nis.\nRationale:\nA custom profile is required to customize many of the pam options\nAudit:\nRun the following command:\nVerify that the custom profile follows local site policy\nRemediation:\nRun the following command to create a custom authselect profile:\nExample:\n# authselect create-profile custom-profile -b sssd --symlink-meta\n      # authselect current | grep Profile 5.3.1: custom/ Profile 5.3.1: custom/<custom profile name>\n             # authselect create-profile <custom-profile name> -b <default profile to copy>\n\n"
    '
    @script_file = ''
    @commands = [{"local"=>"echo 'Automated remediation unavailable. Please remediate manually:\n\nRun the following command to create a custom authselect profile:\n# authselect create-profile <custom-profile name> -b <default profile to copy>\n\nExample:\n# authselect create-profile custom-profile -b sssd --symlink-meta'\n"}]
  end
end
