# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_5_1_6 < CISRemediation
  def initialize
    super('CIS_RHEL8_5_1_6')
    @title = 'Ensure permissions on /etc/cron.monthly are configured (Scored)'
    @scored = true
    @level = 1
    @identifier = '5.1.6'
    @description = '
    "5.1.6 Ensure permissions on /etc/cron.monthly are configured (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation Description:\nThe /etc/cron.monthly directory contains system cron jobs that need to run on a monthly basis. The files in this directory cannot be manipulated by the crontab command, but are instead edited by system administrators \nusing a text editor. The commands below restrict read/write and search access to user and group root, preventing regular users from accessing this directory.\nRationale:\nGranting write access to this directory for non-privileged users could provide them the means for gaining unauthorized elevated privileges. Granting read access to this directory could give an unprivileged user \ninsight in how to gain elevated privileges or circumvent auditing controls.\nAudit:\nRun the following command and verify Uid and Gid are both 0/root and Access does not grant permissions to group or other :\n      # stat /etc/cron.monthly\nAccess: (0700/drwx------) Uid: ( 0/ root) Gid: ( 0/ root)\n\nRemediation:\nRun the following commands to set ownership and permissions on /etc/cron.monthly :\nCIS Controls:\nVersion 7\n5.1 Establish Secure Configurations\nMaintain documented, standard security configuration standards for all authorized operating systems and software.\n      # chown root:root /etc/cron.monthly\n# chmod og-rwx /etc/cron.monthly\n\n"
    '
    @script_file = 'CIS_RHEL8_5_1_6.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_5_1_6.sh"}]
  end
end
