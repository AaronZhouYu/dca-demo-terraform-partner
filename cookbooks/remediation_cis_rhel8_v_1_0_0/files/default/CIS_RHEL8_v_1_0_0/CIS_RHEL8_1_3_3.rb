# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_1_3_3 < CISRemediation
  def initialize
    super('CIS_RHEL8_1_3_3')
    @title = 'Ensure sudo log file exists (Scored)'
    @scored = true
    @level = 1
    @identifier = '1.3.3'
    @description = '
    "1.3.3 Ensure sudo log file exists (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nsudo can use a custom log file\nRationale:\nA sudo log file simplifies auditing of sudo commands\nAudit:\nVerify that sudo has a custom log file configured Run the following command:\n      # grep -Ei ^\s*Defaults\s+([^#]+,\s*)?logfile= /etc/sudoers /etc/sudoers.d/*\n\nRemediation:\nedit the file /etc/sudoers or a file in /etc/sudoers.d/ with visudo -f and add the following line:\nDefaults logfile=\"<PATH TO CUSTOM LOG FILE>\"\n**Example\nDefaults logfile=\"/var/log/sudo.log\"\nImpact:\nediting the sudo configuration incorrectly can cause sudo to stop functioning\nReferences:\n1. SUDO(8) 2. VISUDO(8)\nNotes:\nvisudo edits the sudoers file in a safe fashion, analogous to vipw(8). visudo locks the sudoers file against multiple simultaneous edits, provides basic sanity checks, and checks or parse errors. If the sudoers file \nis currently being edited you will receive a message to try again later.\nCIS Controls:\nVersion 7\n6.3 Enable Detailed Logging\nEnable system logging to include detailed information such as an event source, date, user, timestamp, source addresses, destination addresses, and other useful elements.\n\n"
    '
    @script_file = 'CIS_RHEL8_1_3_3.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_1_3_3.sh"}]
  end
end
