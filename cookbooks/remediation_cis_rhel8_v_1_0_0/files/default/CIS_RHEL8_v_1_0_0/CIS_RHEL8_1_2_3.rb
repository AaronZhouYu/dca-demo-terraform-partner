# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_1_2_3 < CISRemediation
  def initialize
    super('CIS_RHEL8_1_2_3')
    @title = 'Ensure GPG keys are configured (Not Scored)'
    @scored = false
    @level = 1
    @identifier = '1.2.3'
    @description = '
    "1.2.3 Ensure GPG keys are configured (Not Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nMost packages managers implement GPG key signing to verify package integrity during installation.\nRationale:\nIt is important to ensure that updates are obtained from a valid source to protect against spoofing that could lead to the inadvertent installation of malware on the system.\nAudit:\nVerify GPG keys are configured correctly for your package manager. Depending on the package management in use one of the following command groups may provide the needed information:\n# rpm -q gpg-pubkey --qf %{name}-%{version}-%{release} --> %{summary}\n\nRemediation:\nUpdate your package manager GPG keys in accordance with site policy.\nCIS Controls:\nVersion 7\n3.4 Deploy Automated Operating System Patch Management Tools\nDeploy automated software update tools in order to ensure that the operating systems are running the most recent security updates provided by the software vendor.\n\n"
    '
    @script_file = ''
    @commands = [{"local"=>"echo 'Automated remediation unavailable. Please remediate manually:\n\nUpdate your package manager GPG keys in accordance with site policy.'\n"}]
  end
end
