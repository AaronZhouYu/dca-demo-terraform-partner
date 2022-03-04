# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_1_6_1 < CISRemediation
  def initialize
    super('CIS_RHEL8_1_6_1')
    @title = 'Ensure core dumps are restricted (Scored)'
    @scored = true
    @level = 1
    @identifier = '1.6.1'
    @description = '
    "1.6.1 Ensure core dumps are restricted (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nA core dump is the memory of an executable program. It is generally used to determine why a program aborted. It can also be used to glean confidential information from a core file. The system provides the ability to \nset a soft limit for core dumps, but this can be overridden by the user.\nRationale:\nSetting a hard limit on core dumps prevents users from overriding the soft variable. If core dumps are required, consider setting limits for user groups (see limits.conf(5) ). In addition, setting the \nfs.suid_dumpable variable to 0 will prevent setuid programs from dumping core.\nAudit:\nRun the following commands and verify output matches:\n      # grep \"hard core\" /etc/security/limits.conf /etc/security/limits.d/* * hard core 0\n# sysctl fs.suid_dumpable\nfs.suid_dumpable = 0\n# grep \"fs\.suid_dumpable\" /etc/sysctl.conf /etc/sysctl.d/* fs.suid_dumpable = 0\n                 Run the following command to check if systemd-coredump is installed:\n# systemctl is-enabled coredump.service\nif enabled or disabled is returned systemd-coredump is installed\n\nRemediation:\nAdd the following line to /etc/security/limits.conf or a /etc/security/limits.d/* file:\n* hard core 0\nSet the following parameter in /etc/sysctl.conf or a /etc/sysctl.d/* file: fs.suid_dumpable = 0\nRun the following command to set the active kernel parameter:\n# sysctl -w fs.suid_dumpable=0\nIf systemd-coredump is installed:\nedit /etc/systemd/coredump.conf and add/modify the following lines:\nRun the command:\nsystemctl daemon-reload\nCIS Controls:\nVersion 7\n5.1 Establish Secure Configurations\nMaintain documented, standard security configuration standards for all authorized operating systems and software.\n                                 Storage=none\nProcessSizeMax=0\n\n"
    '
    @script_file = 'CIS_RHEL8_1_6_1.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_1_6_1.sh"}]
  end
end
