# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_1_8_2 < CISRemediation
  def initialize
    super('CIS_RHEL8_1_8_2')
    @title = 'Ensure GDM login banner is configured (Scored)'
    @scored = true
    @level = 1
    @identifier = '1.8.2'
    @description = '
    "1.8.2 Ensure GDM login banner is configured (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nGDM is the GNOME Display Manager which handles graphical login for GNOME based systems.\nRationale:\nWarning messages inform users who are attempting to login to the system of their legal status regarding the system and must include the name of the organization that owns the system and any monitoring policies that \nare in place.\nAudit:\nIf GDM is installed on the system verify that /etc/gdm3/greeter.dconf-defaults file exists and contains the following:\n      [org/gnome/login-screen] banner-message-enable=true banner-message-text=<banner message>\n\nRemediation:\nEdit or create the file /etc/gdm3/greeter.dconf-defaults and add the following:\nNotes:\nAdditional options and sections may appear in the /etc/dconf/db/gdm.d/01-banner- message file.\nIf a different GUI login service is in use, consult your documentation and apply an equivalent banner.\nCIS Controls:\nVersion 7\n5.1 Establish Secure Configurations\nMaintain documented, standard security configuration standards for all authorized operating systems and software.\n      [org/gnome/login-screen]\nbanner-message-enable=true\nbanner-message-text=Authorized uses only. All activity may be monitored and reported.\n\n"
    '
    @script_file = 'CIS_RHEL8_1_8_2.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_1_8_2.sh"}]
  end
end
