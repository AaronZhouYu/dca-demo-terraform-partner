# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_1_2_4 < CISRemediation
  def initialize
    super('CIS_RHEL8_1_2_4')
    @title = 'Ensure gpgcheck is globally activated (Scored)'
    @scored = true
    @level = 1
    @identifier = '1.2.4'
    @description = '
    "1.2.4 Ensure gpgcheck is globally activated (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation Description:\nThe gpgcheck option, found in the main section of the /etc/yum.conf and individual /etc/yum/repos.d/* files determines if an RPM packages signature is checked prior to its installation.\nRationale:\nIt is important to ensure that an RPMs package signature is always checked prior to installation to ensure that the software is obtained from a trusted source.\nAudit:\nRun the following command and verify gpgcheck is set to  1 :\nRun the following command and verify that all instances of gpgcheck returned are set to  1 :\n# grep ^gpgcheck /etc/yum.repos.d/*\nRemediation:\nEdit /etc/yum.conf and set gpgcheck=1 in the [main] section.\nEdit any failing files in /etc/yum.repos.d/* and set all instances of gpgcheck to 1.\nCIS Controls:\nVersion 7\n3.4 Deploy Automated Operating System Patch Management Tools\nDeploy automated software update tools in order to ensure that the operating systems are running the most recent security updates provided by the software vendor.\n      # grep ^gpgcheck /etc/yum.conf\ngpgcheck=1\n\n"
    '
    @script_file = 'CIS_RHEL8_1_2_4.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_1_2_4.sh"}]
  end
end
