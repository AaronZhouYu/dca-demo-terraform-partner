# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_1_2_5 < CISRemediation
  def initialize
    super('CIS_RHEL8_1_2_5')
    @title = 'Ensure package manager repositories are configured (Not Scored)'
    @scored = false
    @level = 1
    @identifier = '1.2.5'
    @description = '
    "1.2.5 Ensure package manager repositories are configured (Not Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nSystems need to have package manager repositories configured to ensure they receive the latest patches and updates.\nRationale:\nIf a systems package repositories are misconfigured important patches may not be identified or a rogue repository could introduce compromised software.\nAudit:\nRun the following command to verify repositories are configured correctly:\n# dnf repolist\nRemediation:\nConfigure your package manager repositories according to site policy.\nCIS Controls:\nVersion 7\n3.4 Deploy Automated Operating System Patch Management Tools\nDeploy automated software update tools in order to ensure that the operating systems are running the most recent security updates provided by the software vendor.\n\n"
    '
    @script_file = ''
    @commands = [{"local"=>"echo 'Automated remediation unavailable. Please remediate manually:\n\nConfigure your package manager repositories according to site policy.'\n"}]
  end
end
