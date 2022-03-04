# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_6_2_6 < CISRemediation
  def initialize
    super('CIS_RHEL8_6_2_6')
    @title = 'Ensure root is the only UID 0 account (Scored)'
    @scored = true
    @level = 1
    @identifier = '6.2.6'
    @description = '
    "6.2.6 Ensure root is the only U6.2.6 0 account (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nAny account with U6.2.6 0 has superuser privileges on the system.\nRationale:\nThis access must be limited to only the default root account and only from the system console. Administrative access must be through an unprivileged account using an approved mechanism as noted in Item 5.6 Ensure \naccess to the su command is restricted.\nAudit:\nRun the following command and verify that only \"root\" is returned:\nRemediation:\nRemove any users other than root with U6.2.6 0 or assign them a new U6.2.6 if appropriate.\nCIS Controls:\nVersion 7\n5.1 Establish Secure Configurations\nMaintain documented, standard security configuration standards for all authorized operating systems and software.\n      # awk -F: ($3 == 0) { print $1 } /etc/passwd\nroot\n\n"
    '
    @script_file = ''
    @commands = [{"local"=>"echo 'Automated remediation unavailable. Please remediate manually:\n\nRemove any users other than root with U6.2.6 0 or assign them a new U6.2.6 if appropriate.'\n"}]
  end
end
