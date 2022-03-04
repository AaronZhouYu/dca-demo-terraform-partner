# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_5_2_1 < CISRemediation
  def initialize
    super('CIS_RHEL8_5_2_1')
    @title = 'Ensure permissions on /etc/ssh/sshd_config are configured (Scored)'
    @scored = true
    @level = 1
    @identifier = '5.2.1'
    @description = '
    "5.2.1 Ensure permissions on /etc/ssh/sshd_config are configured (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nThe /etc/ssh/sshd_config file contains configuration specifications for sshd. The command below sets the owner and group of the file to root.\nRationale:\nThe /etc/ssh/sshd_config file needs to be protected from unauthorized changes by non- privileged users.\nAudit:\nRun the following command and verify Uid and Gid are both 0/root and Access does not grant permissions to group or other:\nRemediation:\nRun the following commands to set ownership and permissions on /etc/ssh/sshd_config:\nCIS Controls:\nVersion 7\n5.1 Establish Secure Configurations\nMaintain documented, standard security configuration standards for all authorized operating systems and software.\n      # stat /etc/ssh/sshd_config\nAccess: (0600/-rw-------) Uid: ( 0/ root) Gid: ( 0/ root)\n           # chown root:root /etc/ssh/sshd_config\n# chmod og-rwx /etc/ssh/sshd_config\n\n"
    '
    @script_file = 'CIS_RHEL8_5_2_1.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_5_2_1.sh"}]
  end
end
