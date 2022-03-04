# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_1_3_2 < CISRemediation
  def initialize
    super('CIS_RHEL8_1_3_2')
    @title = 'Ensure sudo commands use pty (Scored)'
    @scored = true
    @level = 1
    @identifier = '1.3.2'
    @description = '
    "1.3.2 Ensure sudo commands use pty (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nsudo can be configured to run only from a psuedo-pty\nRationale:\nAttackers can run a malicious program using sudo which would fork a background process that remains even when the main program has finished executing.\nAudit:\nVerify that sudo can only run other commands from a psuedo-pty Run the following command:\n      # grep -Ei ^\s*Defaults\s+(\[^#]+,\s*)?use_pty /etc/sudoers /etc/sudoers.d/*\n\nRemediation:\nedit the file /etc/sudoers or a file in /etc/sudoers.d/ with visudo -f and add the following line:\nDefaults use_pty\nImpact:\nediting the sudo configuration incorrectly can cause sudo to stop functioning.\nReferences:\n1. SUDO(8) 2. VISUDO(8)\nNotes:\nvisudo edits the sudoers file in a safe fashion, analogous to vipw(8). visudo locks the sudoers file against multiple simultaneous edits, provides basic sanity checks, and checks or parse errors. If the sudoers file \nis currently being edited you will receive a message to try again later.\nCIS Controls:\nVersion 7\n5.1 Establish Secure Configurations\nMaintain documented, standard security configuration standards for all authorized operating systems and software.\n\n"
    '
    @script_file = 'CIS_RHEL8_1_3_2.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_1_3_2.sh"}]
  end
end
