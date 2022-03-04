# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_5_2_3 < CISRemediation
  def initialize
    super('CIS_RHEL8_5_2_3')
    @title = 'Ensure permissions on SSH private host key files are configured (Scored)'
    @scored = true
    @level = 1
    @identifier = '5.2.3'
    @description = '
    "5.2.3 Ensure permissions on SSH private host key files are configured (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nAn SSH private key is one of two files used in SSH public key authentication. In this authentication method, The possession of the private key is proof of identity. Only a private key that corresponds to a public key \nwill be able to authenticate successfully. The private keys need to be stored and handled carefully, and no copies of the private key should be distributed.\nRationale:\nIf an unauthorized user obtains the private SSH host key file, the host could be impersonated\n\nAudit:\nRun the following command and verify Uid is 0/root and and Gid is 0/root. Ensure group and other do not have permissions\n      # find /etc/ssh -xdev -type f -name ssh_host_*_key -exec stat {} \;\n  File: /etc/ssh/ssh_host_rsa_key\nSize: 1679 Blocks: 8 IO Block: 4096 regular file Device: ca01h/51713d Inode: 8628138 Links: 1\nAccess: (0600/-rw-------) Uid: ( 0/ root) Gid: ( 0/root) Access: 2018-10-22 18:24:56.861750616 +0000\nModify: 2018-10-22 18:24:56.861750616 +0000 Change: 2018-10-22 18:24:56.873750616 +0000\n                   Birth: -\nFile: /etc/ssh/ssh_host_ecdsa_key Size: 227 Blocks: 8\nDevice: ca01h/51713d Inode: 8631760 Access: (0600/-rw-------) Uid: ( 0/ Access: 2018-10-22 18:24:56.897750616 +0000 Modify: 2018-10-22 18:24:56.897750616 +0000 Change: 2018-10-22 18:24:56.905750616 +0000\nBirth: -\nFile: /etc/ssh/ssh_host_ed25519_key Size: 387 Blocks: 8\nDevice: ca01h/51713d Inode: 8631762 Access: (0600/-rw-------) Uid: ( 0/ Access: 2018-10-22 18:24:56.945750616 +0000 Modify: 2018-10-22 18:24:56.945750616 +0000 Change: 2018-10-22 18:24:56.957750616 +0000\nBirth: -\nIO Block: 4096   regular file\nLinks: 1\nroot)   Gid: (  0/root)\n                    IO Block: 4096\nLinks: 1\nroot)   Gid: ( 0/root)\nregular file\n               Remediation:\nRun the following commands to set ownership and permissions on the private SSH host key files\nCIS Controls:\nVersion 7\n5.1 Establish Secure Configurations\nMaintain documented, standard security configuration standards for all authorized operating systems and software.\n      # find /etc/ssh -xdev -type f -name ssh_host_*_key -exec chown root:root {} \;\n# find /etc/ssh -xdev -type f -name ssh_host_*_key -exec chmod 0600 {} \;\n\n"
    '
    @script_file = 'CIS_RHEL8_5_2_3.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_5_2_3.sh"}]
  end
end
