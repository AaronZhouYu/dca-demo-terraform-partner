# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_2_2_2 < CISRemediation
  def initialize
    super('CIS_RHEL8_2_2_2')
    @title = 'Ensure X Window System is not installed (Scored)'
    @scored = true
    @level = 1
    @identifier = '2.2.2'
    @description = '
    "2.2.2 Ensure X Window System is not installed (Scored)\nProfile Applicability:\n Level 1 - Server Description:\nThe X Window System provides a Graphical User Interface (GUI) where users can have multiple windows in which to run programs and various add on. The X Windows system is typically used on workstations where users \nlogin, but not on servers where users typically do not login.\nRationale:\nUnless your organization specifically requires graphical login access via X Windows, remove it to reduce the potential attack surface.\nAudit:\nRun the following command to Verify X Windows System is not installed.\n# rpm -qa xorg-x11*\nRemediation:\nRun the following command to remove the X Windows System packages.\n# dnf remove xorg-x11*\nImpact:\nMany Linux systems run applications which require a Java runtime. Some Linux Java packages have a dependency on specific X Windows xorg-x11-fonts. One workaround to avoid this dependency is to use the \"headless\" Java \npackages for your specific Java runtime, if provided by your distribution.\nCIS Controls:\nVersion 7\n2.6 Address unapproved software\nEnsure that unauthorized software is either removed or the inventory is updated in a timely manner\n\n"
    '
    @script_file = 'CIS_RHEL8_2_2_2.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_2_2_2.sh"}]
  end
end
