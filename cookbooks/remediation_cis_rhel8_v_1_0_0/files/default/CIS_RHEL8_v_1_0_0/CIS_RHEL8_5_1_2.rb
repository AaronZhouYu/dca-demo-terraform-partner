# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_5_1_2 < CISRemediation
  def initialize
    super('CIS_RHEL8_5_1_2')
    @title = 'Ensure permissions on /etc/crontab are configured (Scored)'
    @scored = true
    @level = 1
    @identifier = '5.1.2'
    @description = '
    "5.1.2 Ensure permissions on /etc/crontab are configured (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation Description:\nThe /etc/crontab file is used by cron to control its own jobs. The commands in this item make sure that root is the user and group owner of the file and that only the owner can access the file.\nRationale:\nThis file contains information on what system jobs are run by cron. Write access to these files could provide unprivileged users with the ability to elevate their privileges. Read access to these files could provide \nusers with the ability to gain insight on system jobs that run on the system and could provide them a way to gain unauthorized privileged access.\nAudit:\nRun the following command and verify Uid and Gid are both 0/root and Access does not grant permissions to group or other :\nRemediation:\nRun the following commands to set ownership and permissions on /etc/crontab :\nCIS Controls:\nVersion 7\n5.1 Establish Secure Configurations\nMaintain documented, standard security configuration standards for all authorized operating systems and software.\n      # stat /etc/crontab\nAccess: (0600/-rw-------) Uid: ( 0/ root) Gid: ( 0/ root)\n           # chown root:root /etc/crontab\n# chmod og-rwx /etc/crontab\n\n"
    '
    @script_file = 'CIS_RHEL8_5_1_2.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_5_1_2.sh"}]
  end
end
