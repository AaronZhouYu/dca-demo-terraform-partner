# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_1_9 < CISRemediation
  def initialize
    super('CIS_RHEL8_1_9')
    @title = 'Ensure updates, patches, and additional security software are installed (Scored)'
    @scored = true
    @level = 1
    @identifier = '1.9'
    @description = '
    "1.9 Ensure updates, patches, and additional security software are installed (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nPeriodically patches are released for included software either due to security flaws or to include additional functionality.\nRationale:\nNewer patches may contain security enhancements that would not be available through the latest full update. As a result, it is recommended that the latest software patches be used to take advantage of the latest \nfunctionality. As with any software installation, organizations need to determine if a given update meets their requirements and verify the compatibility and supportability of any additional software against the \nupdate revision that is selected.\nAudit:\nRun the following command and verify there are no updates or patches to install:\n# dnf check-update --security\n\nRemediation:\nUse your package manager to update all packages on the system according to site policy. The following command will install all available security updates:\n# dnf update --security\nNotes:\nSite policy may mandate a testing period before install onto production systems for available updates.\nThe audit and remediation here only cover security updates. Non-security updates can be audited with and comparing against site policy:\n# dnf check-update\nCIS Controls:\nVersion 7\n3.4 Deploy Automated Operating System Patch Management Tools\nDeploy automated software update tools in order to ensure that the operating systems are running the most recent security updates provided by the software vendor.\n\n"
    '
    @script_file = ''
    @commands = [{"local"=>"echo 'Automated remediation unavailable. Please remediate manually:\n\nUse your package manager to update all packages on the system according to site policy.'\n"}]
  end
end
