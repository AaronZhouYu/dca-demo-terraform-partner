# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_1_4_1 < CISRemediation
  def initialize
    super('CIS_RHEL8_1_4_1')
    @title = 'Ensure AIDE is installed (Scored)'
    @scored = true
    @level = 1
    @identifier = '1.4.1'
    @description = '
    "1.4.1 Ensure A1.4.1E is installed (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nA1.4.1E takes a snapshot of filesystem state including modification times, permissions, and file hashes which can then be used to compare against the current state of the filesystem to detect modifications to the \nsystem.\nRationale:\nBy monitoring the filesystem state compromised files can be detected to prevent or limit the exposure of accidental or malicious misconfigurations or modified binaries.\nAudit:\nRun the following command and verify aide is installed:\n      # rpm -q aide\naide-<version>\n\nRemediation:\nRun the following command to install A1.4.1E:\n# dnf install aide\nConfigure A1.4.1E as appropriate for your environment. Consult the A1.4.1E documentation for options.\nInitialize A1.4.1E:\nRun the following commands:\nReferences:\n1. A1.4.1E stable manual: http://aide.sourceforge.net/stable/manual.html Notes:\nThe prelinking feature can interfere with A1.4.1E because it alters binaries to speed up their start up times. Run prelink -ua to restore the binaries to their prelinked state, thus avoiding false positives from A1.4.1E.\nCIS Controls:\nVersion 7\n14.9 Enforce Detail Logging for Access or Changes to Sensitive Data\nEnforce detailed audit logging for access to sensitive data or changes to sensitive data (utilizing tools such as File Integrity Monitoring or Security Information and Event Monitoring).\n               # aide --init\n# mv /var/lib/aide/aide.db.new.gz /var/lib/aide/aide.db.gz\n\n"
    '
    @script_file = 'CIS_RHEL8_1_4_1.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_1_4_1.sh"}]
  end
end
