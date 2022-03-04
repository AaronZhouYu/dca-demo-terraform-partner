# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_5_2_4 < CISRemediation
  def initialize
    super('CIS_RHEL8_5_2_4')
    @title = 'Ensure permissions on SSH public host key files are configured (Scored)'
    @scored = true
    @level = 1
    @identifier = '5.2.4'
    @description = '
    "5.2.4 Ensure permissions on SSH public host key files are configured (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nAn SSH public key is one of two files used in SSH public key authentication. In this authentication method, a public key is a key that can be used for verifying digital signatures generated using a corresponding \nprivate key. Only a public key that corresponds to a private key will be able to authenticate successfully.\nRationale:\nIf a public host key file is modified by an unauthorized user, the SSH service may be compromised.\n\nAudit:\nRun the following command and verify Access does not grant write or execute permissions to group or other for all returned files\n      # find /etc/ssh -xdev -type f -name ssh_host_*_key.pub -exec stat {} \;\nFile: /etc/ssh/ssh_host_rsa_key.pub\nSize: 382 Blocks: 8 IO Block: 4096 regular file Device: ca01h/51713d Inode: 8631758 Links: 1\nAccess: (0644/-rw-r--r--) Uid: ( 0/ root) Gid: ( 0/ root) Access: 2018-10-22 18:24:56.861750616 +0000\nModify: 2018-10-22 18:24:56.861750616 +0000 Change: 2018-10-22 18:24:56.881750616 +0000\n                   Birth: -\nFile: /etc/ssh/ssh_host_ecdsa_key.pub\nSize: 162 Blocks: 8 IO Block: 4096 regular file\nDevice: ca01h/51713d Inode: 8631761 Links: 1\nAccess: (0644/-rw-r--r--) Uid: ( 0/ root) Gid: ( 0/ root) Access: 2018-10-22 18:24:56.897750616 +0000\nModify: 2018-10-22 18:24:56.897750616 +0000\nChange: 2018-10-22 18:24:56.917750616 +0000\n                Birth: -\nFile: /etc/ssh/ssh_host_ed25519_key.pub\nSize: 82 Blocks: 8 IO Block: 4096\nregular file\n      Device: ca01h/51713d Inode: 8631763 Links: 1\nAccess: (0644/-rw-r--r--) Uid: ( 0/ root) Gid: ( 0/ root) Access: 2018-10-22 18:24:56.945750616 +0000\nModify: 2018-10-22 18:24:56.945750616 +0000\nChange: 2018-10-22 18:24:56.961750616 +0000\nBirth: -\n             Remediation:\nRun the following commands to set permissions and ownership on the SSH host public key files\nCIS Controls:\nVersion 7\n5.1 Establish Secure Configurations\nMaintain documented, standard security configuration standards for all authorized operating systems and software.\n      # find /etc/ssh -xdev -type f -name ssh_host_*_key.pub -exec chmod 0644 {} \;\n#find /etc/ssh -xdev -type f -name ssh_host_*_key.pub -exec chown root:root {} \;\n\n"
    '
    @script_file = 'CIS_RHEL8_5_2_4.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_5_2_4.sh"}]
  end
end
