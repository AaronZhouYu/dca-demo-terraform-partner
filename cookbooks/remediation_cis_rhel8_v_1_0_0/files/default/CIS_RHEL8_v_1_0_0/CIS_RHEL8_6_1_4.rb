# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_6_1_4 < CISRemediation
  def initialize
    super('CIS_RHEL8_6_1_4')
    @title = 'Ensure permissions on /etc/group are configured (Scored)'
    @scored = true
    @level = 1
    @identifier = '6.1.4'
    @description = '
    "6.1.4 Ensure permissions on /etc/group are configured (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nThe /etc/group file contains a list of all the valid groups defined in the system. The command below allows read/write access for root and read access for everyone else.\nRationale:\nThe /etc/group file needs to be protected from unauthorized changes by non-privileged users, but needs to be readable as this information is used with many non-privileged programs.\nAudit:\nRun the following command and verify Uid and Gid are both 0/root and Access is 644 :\nRemediation:\nRun the following command to set permissions on /etc/group :\nCIS Controls:\nVersion 7\n16.4 Encrypt or Hash all Authentication Credentials\nEncrypt or hash with a salt all authentication credentials when stored.\n      # stat /etc/group\nAccess: (0644/-rw-r--r--) Uid: ( 0/ root) Gid: ( 0/ root)\n           # chown root:root /etc/group\n# chmod 644 /etc/group\n\n"
    '
    @script_file = 'CIS_RHEL8_6_1_4.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_6_1_4.sh"}]
  end
end
