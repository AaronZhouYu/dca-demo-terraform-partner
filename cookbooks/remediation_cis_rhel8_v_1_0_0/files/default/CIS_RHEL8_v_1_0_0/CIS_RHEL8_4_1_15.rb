# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_4_1_15 < CISRemediation
  def initialize
    super('CIS_RHEL8_4_1_15')
    @title = 'Ensure kernel module loading and unloading is collected (Scored)'
    @scored = true
    @level = 2
    @identifier = '4.1.15'
    @description = '
    "4.1.15 Ensure kernel module loading and unloading is collected (Scored)\nProfile Applicability:\n Level 2 - Server\n Level 2 - Workstation Description:\nMonitor the loading and unloading of kernel modules. The programs insmod (install a kernel module), rmmod (remove a kernel module), and modprobe (a more sophisticated program to load and unload modules, as well as \nsome other features) control loading and unloading of modules. The init_module (load a module) and delete_module (delete a module) system calls control loading and unloading of modules. Any execution of the loading \nand unloading module programs and system calls will trigger an audit record with an identifier of \"modules\".\nRationale:\nMonitoring the use of insmod , rmmod and modprobe could provide system administrators with evidence that an unauthorized user loaded or unloaded a kernel module, possibly compromising the security of the system. \nMonitoring of the init_module and delete_module system calls would reflect an unauthorized user attempting to use a different program to load and unload modules.\nAudit:\nRun the following commands:\nVerify output of both matches:\n      # grep modules /etc/audit/rules.d/*.rules # auditctl -l | grep modules\n           -w /sbin/insmod -p x -k modules\n-w /sbin/rmmod -p x -k modules\n-w /sbin/modprobe -p x -k modules\n-a always,exit -F arch=b64 -S init_module -S delete_module -k modules\n\nRemediation:\nEdit or create a file in the /etc/audit/rules.d/ directory ending in .rules Example: vi /etc/audit/rules.d/modules.rules\nand add the following lines:\nNotes:\nReloading the auditd config to set active settings may require a system reboot.\nCIS Controls:\nVersion 7\n5.1 Establish Secure Configurations\nMaintain documented, standard security configuration standards for all authorized operating systems and software.\n      -w /sbin/insmod -p x -k modules\n-w /sbin/rmmod -p x -k modules\n-w /sbin/modprobe -p x -k modules\n-a always,exit -F arch=b64 -S init_module -S delete_module -k modules\n\n"
    '
    @script_file = 'CIS_RHEL8_4_1_15.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_4_1_15.sh"}]
  end
end
