# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_4_2_2_2 < CISRemediation
  def initialize
    super('CIS_RHEL8_4_2_2_2')
    @title = 'Ensure journald is configured to compress large log files (Scored)'
    @scored = true
    @level = 1
    @identifier = '4.2.2.2'
    @description = '
    "4.2.2.2 Ensure journald is configured to compress large log files (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nThe journald system includes the capability of compressing overly large files to avoid filling up the system with logs or making the logs unmanageably large.\nRationale:\nUncompressed large files may unexpectedly fill a filesystem leading to resource unavailability. Compressing logs prior to write can prevent sudden, unexpected filesystem impacts.\nAudit:\nReview /etc/systemd/journald.conf and verify that large files will be compressed:\n      # grep -e ^\s*Compress /etc/systemd/journald.conf Compress=yes\n\nRemediation:\nEdit the /etc/systemd/journald.conf file and add the following line: Compress=yes\nReferences:\n1. https://github.com/konstruktoid/hardening/blob/master/systemd.adoc#etcsyste mdjournaldconf\nNotes:\nThe main configuration file /etc/systemd/journald.conf is read before any of the custom *.conf files. If there are custom configs present, they override the main configuration parameters\nCIS Controls:\nVersion 7\n6.4 Ensure adequate storage for logs\nEnsure that all systems that store logs have adequate storage space for the logs generated.\n\n"
    '
    @script_file = 'CIS_RHEL8_4_2_2_2.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_4_2_2_2.sh"}]
  end
end
