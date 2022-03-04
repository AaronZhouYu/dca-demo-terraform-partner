# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_1_8_1_2 < CISRemediation
  def initialize
    super('CIS_RHEL8_1_8_1_2')
    @title = 'Ensure local login warning banner is configured properly (Scored)'
    @scored = true
    @level = 1
    @identifier = '1.8.1.2'
    @description = '
    "1.8.1.2 Ensure local login warning banner is configured properly (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nThe contents of the /etc/issue file are displayed to users prior to login for local terminals.\nUnix-based systems have typically displayed information about the OS release and patch level upon logging in to the system. This information can be useful to developers who are developing software for a particular OS \nplatform. If mingetty(8) supports the following options, they display operating system information: \m - machine architecture \r - operating system release \s - operating system name \v - operating system version - \nor the operating systems name\nRationale:\nWarning messages inform users who are attempting to login to the system of their legal status regarding the system and must include the name of the organization that owns the system and any monitoring policies that \nare in place. Displaying OS and patch level information in login banners also has the side effect of providing detailed system information to attackers attempting to target specific exploits of a system. Authorized \nusers can easily get this information by running the \" uname -a \" command once they have logged in.\nAudit:\nRun the following command and verify that the contents match site policy:\n# cat /etc/issue\nRun the following command and verify no results are returned:\n               # grep -E -i \"(\\\v|\\\r|\\\m|\\\s|$(grep ^1.8.1.2= /etc/os-release | cut -d= - f2 | sed -e s/\"//g))\" /etc/issue\n\nRemediation:\nEdit the /etc/issue file with the appropriate contents according to your site policy, remove any instances of \m , \r , \s , \v or references to the OS platform\nCIS Controls:\nVersion 7\n5.1 Establish Secure Configurations\nMaintain documented, standard security configuration standards for all authorized operating systems and software.\n      # echo \"Authorized uses only. All activity may be monitored and reported.\" > /etc/issue\n\n"
    '
    @script_file = 'CIS_RHEL8_1_8_1_2.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_1_8_1_2.sh"}]
  end
end
