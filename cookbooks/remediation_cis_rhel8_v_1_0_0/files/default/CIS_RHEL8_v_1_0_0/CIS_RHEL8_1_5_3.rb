# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_1_5_3 < CISRemediation
  def initialize
    super('CIS_RHEL8_1_5_3')
    @title = 'Ensure authentication required for single user mode (Scored)'
    @scored = true
    @level = 1
    @identifier = '1.5.3'
    @description = '
    "1.5.3 Ensure authentication required for single user mode (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nSingle user mode (rescue mode) is used for recovery when the system detects an issue during boot or by manual selection from the bootloader.\nRationale:\nRequiring authentication in single user mode (rescue mode) prevents an unauthorized user from rebooting the system into single user to gain root privileges without credentials.\nAudit:\nRun the following commands and verify that /sbin/sulogin or /usr/sbin/sulogin is used as shown:\n      # grep /systemd-sulogin-shell /usr/lib/systemd/system/rescue.service ExecStart=-/usr/lib/systemd/systemd-sulogin-shell rescue\n# grep /systemd-sulogin-shell /usr/lib/systemd/system/emergency.service ExecStart=-/usr/lib/systemd/systemd-sulogin-shell emergency\n\nRemediation:\nEdit /usr/lib/systemd/system/rescue.service and add/modify the following line: ExecStart=-/usr/lib/systemd/systemd-sulogin-shell rescue\nEdit /usr/lib/systemd/system/emergency.service and add/modify the following line: ExecStart=-/usr/lib/systemd/systemd-sulogin-shell emergency\nCIS Controls:\nVersion 7\n5.1 Establish Secure Configurations\nMaintain documented, standard security configuration standards for all authorized operating systems and software.\n\n"
    '
    @script_file = 'CIS_RHEL8_1_5_3.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_1_5_3.sh"}]
  end
end
