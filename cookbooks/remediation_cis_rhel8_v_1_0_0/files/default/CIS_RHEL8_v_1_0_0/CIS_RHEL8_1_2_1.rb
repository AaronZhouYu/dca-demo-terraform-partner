# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_1_2_1 < CISRemediation
  def initialize
    super('CIS_RHEL8_1_2_1')
    @title = 'Ensure Red Hat Subscription Manager connection is configured (Not Scored)'
    @scored = false
    @level = 1
    @identifier = '1.2.1'
    @description = '
    "1.2.1 Ensure Red Hat Subscription Manager connection is configured (Not Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nSystems need to be registered with the Red Hat Subscription Manager (RHSM) to receive patch updates. This is usually configured during initial installation.\nRationale:\nIt is important to register with the Red Hat Subscription Manager to make sure that patches are updated on a regular basis. This helps to reduce the exposure time as new vulnerabilities are discovered.\nAudit:\nVerify your system is connected to the Red Hat Subscription Manager.\nIf connected to RHSM your system1.2.1 can be retrieved with the following command:\n# subscription-manager identity\n\nRemediation:\nRun the following command to connect to the Red Hat Subscription Manager:\n# subscription-manager register\nCIS Controls:\nVersion 7\n3.4 Deploy Automated Operating System Patch Management Tools\nDeploy automated software update tools in order to ensure that the operating systems are running the most recent security updates provided by the software vendor.\n\n"
    '
    @script_file = ''
    @commands = [{"local"=>"echo 'Automated remediation unavailable. Please remediate manually:\n\nRun the following command to connect to the Red Hat Subscription Manager\nsubscription-manager register'\n"}]
  end
end
