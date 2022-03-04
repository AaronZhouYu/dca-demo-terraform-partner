# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_1_1_23 < CISRemediation
  def initialize
    super('CIS_RHEL8_1_1_23')
    @title = 'Disable USB Storage (Scored)'
    @scored = true
    @level = 2
    @identifier = '1.1.23'
    @description = '
    "1.1.23 Disable USB Storage (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 2 - Workstation\nDescription:\nUSB storage provides a means to transfer and store files insuring persistence and availability of the files independent of network connection status. Its popularity and utility has led to USB-based malware being a \nsimple and common means for network infiltration and a first step to establishing a persistent threat within a networked environment.\nRationale:\nRestricting USB access on the system will decrease the physical attack surface for a device and diminish the possible vectors to introduce malware.\nAudit:\nRun the following commands and verify the output is as indicated:\n      # modprobe -n -v usb-storage\ninstall /bin/true\n# lsmod | grep usb-storage\n<No output>\n\nRemediation:\nEdit or create a file in the /etc/modprobe.d/ directory ending in .conf Example: vim /etc/modprobe.d/usb-storage.conf\nand add the following line:\ninstall usb-storage /bin/true\nRun the following command to unload the usb-storage module:\nrmmod usb-storage\nNotes:\nAn alternative solution to disabling the usb-storage module may be found in USBGuard. Red Hat documents the use of the USBGuard framework for fine-grained, policy-driven control of USB devices on Red Hat Enterprise \nLinux systems at https://access.redhat.com/documentation/en- us/red_hat_enterprise_linux/7/html/security_guide/sec-using-usbguard.\nUse of USBGuard and construction of USB device policies should be done in alignment with site policy.\nCIS Controls:\nVersion 7\n8.4 Configure Anti-Malware Scanning of Removable Devices\nConfigure devices so that they automatically conduct an anti-malware scan of removable media when inserted or connected.\n8.5 Configure Devices Not To Auto-run Content\nConfigure devices to not auto-run content from removable media.\n\n"
    '
    @script_file = 'CIS_RHEL8_1_1_23.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_1_1_23.sh"}]
  end
end
