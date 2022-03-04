# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_1_7_1_3 < CISRemediation
  def initialize
    super('CIS_RHEL8_1_7_1_3')
    @title = 'Ensure SELinux policy is configured (Scored)'
    @scored = true
    @level = 2
    @identifier = '1.7.1.3'
    @description = '
    "1.7.1.3 Ensure SELinux policy is configured (Scored)\nProfile Applicability:\n Level 2 - Server\n Level 2 - Workstation\nDescription:\nConfigure SELinux to meet or exceed the default targeted policy, which constrains daemons and system software only.\nRationale:\nSecurity configuration requirements vary from site to site. Some sites may mandate a policy that is stricter than the default policy, which is perfectly acceptable. This item is intended to ensure that at least the \ndefault recommendations are met.\nAudit:\nRun the following commands and ensure output matches either \" targeted \" or \" mls \":\n      # grep -E ^\s*SELINUXTYPE=(targeted|mls)\b /etc/selinux/config SELINUXTYPE=targeted\n# sestatus | grep Loaded\nLoaded policy name: targeted\n\nRemediation:\nEdit the /etc/selinux/config file to set the SELINUXTYPE parameter:\nSELINUXTYPE=targeted\nNotes:\nIf your organization requires stricter policies, ensure that they are set in the /etc/selinux/config file.\nCIS Controls:\nVersion 7\n14.6 Protect Information through Access Control Lists\nProtect all information stored on systems with file system, network share, claims, application, or database specific access control lists. These controls will enforce the principle that only authorized individuals \nshould have access to the information based on their need to access the information as a part of their responsibilities.\n\n"
    '
    @script_file = 'CIS_RHEL8_1_7_1_3.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_1_7_1_3.sh"}]
  end
end
