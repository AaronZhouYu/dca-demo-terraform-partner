# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_1_7_1_5 < CISRemediation
  def initialize
    super('CIS_RHEL8_1_7_1_5')
    @title = 'Ensure no unconfined services exist (Scored)'
    @scored = true
    @level = 2
    @identifier = '1.7.1.5'
    @description = '
    "1.7.1.5 Ensure no unconfined services exist (Scored)\nProfile Applicability:\n Level 2 - Server\n Level 2 - Workstation\nDescription:\nUnconfined processes run in unconfined domains\nRationale:\nFor unconfined processes, SELinux policy rules are applied, but policy rules exist that allow processes running in unconfined domains almost all access. Processes running in unconfined domains fall back to using DAC \nrules exclusively. If an unconfined process is compromised, SELinux does not prevent an attacker from gaining access to system resources and data, but of course, DAC rules are still used. SELinux is a security \nenhancement on top of DAC rules  it does not replace them\nAudit:\nRun the following command and verify not output is produced:\n# ps -eZ | grep unconfined_service_t\nRemediation:\nInvestigate any unconfined processes found during the audit action. They may need to have an existing security context assigned to them or a policy built for them.\nNotes:\nOccasionally certain daemons such as backup or centralized management software may require running unconfined. Any such software should be carefully analyzed and documented before such an exception is made.\nCIS Controls:\nVersion 7\n9.2 Ensure Only Approved Ports, Protocols and Services Are Running\nEnsure that only network ports, protocols, and services listening on a system with validated business needs, are running on each system.\n\n"
    '
    @script_file = ''
    @commands = [{"local"=>"echo 'Automated remediation unavailable. Please remediate manually:\n\nInvestigate any unconfined processes found during the audit action. They may need to have an existing security context assigned to them or a policy built for them.'\n"}]
  end
end
