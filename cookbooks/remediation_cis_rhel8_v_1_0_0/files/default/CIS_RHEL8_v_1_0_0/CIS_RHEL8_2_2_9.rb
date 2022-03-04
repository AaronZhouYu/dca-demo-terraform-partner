# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_2_2_9 < CISRemediation
  def initialize
    super('CIS_RHEL8_2_2_9')
    @title = 'Ensure HTTP server is not enabled (Scored)'
    @scored = true
    @level = 1
    @identifier = '2.2.9'
    @description = '
    "2.2.9 Ensure HTTP server is not enabled (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nHTTP or web servers provide the ability to host web site content.\nRationale:\nUnless there is a need to run the system as a web server, it is recommended that the package be deleted to reduce the potential attack surface.\nAudit:\nRun the following command to verify httpd is not enabled:\nVerify result is not \"enabled\".\n      # systemctl is-enabled httpd\ndisabled\n\nRemediation:\nRun the following command to disable httpd :\n# systemctl --now disable httpd\nNotes:\nAdditional methods of disabling a service exist. Consult your distribution documentation for appropriate methods.\nSeveral httpd servers exist and can use other service names. apache, apache2, lighttpd, and nginx are example services that provide an HTTP server. These and other services should also be audited.\nCIS Controls:\nVersion 7\n9.2 Ensure Only Approved Ports, Protocols and Services Are Running\nEnsure that only network ports, protocols, and services listening on a system with validated business needs, are running on each system.\n\n"
    '
    @script_file = 'CIS_RHEL8_2_2_9.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_2_2_9.sh"}]
  end
end
