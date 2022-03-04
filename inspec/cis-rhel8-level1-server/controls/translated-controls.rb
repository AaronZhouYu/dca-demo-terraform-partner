# encoding: UTF-8

control "xccdf_org.cisecurity.benchmarks_rule_1.1.1.1_Ensure_mounting_of_cramfs_filesystems_is_disabled" do
  title "Ensure mounting of cramfs filesystems is disabled"
  desc  "
    The cramfs filesystem type is a compressed read-only Linux filesystem embedded in small footprint systems. A cramfs image can be used without having to first decompress the image.
    
    Rationale: Removing support for unneeded filesystem types reduces the local attack surface of the server. If this filesystem type is not needed, disable it.
  "
  impact 1.0
  a = command("modprobe -n -v cramfs").stdout.scan(/.+/)
  describe a do
    its("length") { should be > 0 }
  end
  describe.one do
    a.each do |entry|
      describe entry do
        it { should match(/^install\s+\/bin\/true\s*$/) }
      end
    end
  end
  a = command("modprobe -n -v cramfs").stdout.scan(/.+/)
  describe a do
    its("length") { should be > 0 }
  end
  a.each do |entry|
    describe entry do
      it { should_not match(/^cramfs\s+/) }
    end
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_1.1.1.3_Ensure_mounting_of_squashfs_filesystems_is_disabled" do
  title "Ensure mounting of squashfs filesystems is disabled"
  desc  "
    The squashfs filesystem type is a compressed read-only Linux filesystem embedded in small footprint systems (similar to cramfs ). A squashfs image can be used without having to first decompress the image.
    
    Rationale: Removing support for unneeded filesystem types reduces the local attack surface of the system. If this filesystem type is not needed, disable it.
  "
  impact 1.0
  a = command("modprobe -n -v squashfs").stdout.scan(/.+/)
  describe a do
    its("length") { should be > 0 }
  end
  describe.one do
    a.each do |entry|
      describe entry do
        it { should match(/^install\s+\/bin\/true\s*$/) }
      end
    end
  end
  a = command("modprobe -n -v squashfs").stdout.scan(/.+/)
  describe a do
    its("length") { should be > 0 }
  end
  a.each do |entry|
    describe entry do
      it { should_not match(/^squashfs\s+/) }
    end
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_1.1.1.4_Ensure_mounting_of_udf_filesystems_is_disabled" do
  title "Ensure mounting of udf filesystems is disabled"
  desc  "
    The udf filesystem type is the universal disk format used to implement ISO/IEC 13346 and ECMA-167 specifications. This is an open vendor filesystem type for data storage on a broad range of media. This filesystem type is necessary to support writing DVDs and newer optical disc formats.
    
    Rationale: Removing support for unneeded filesystem types reduces the local attack surface of the system. If this filesystem type is not needed, disable it.
  "
  impact 1.0
  a = command("modprobe -n -v udf").stdout.scan(/.+/)
  describe a do
    its("length") { should be > 0 }
  end
  describe.one do
    a.each do |entry|
      describe entry do
        it { should match(/^install\s+\/bin\/true\s*$/) }
      end
    end
  end
  a = command("modprobe -n -v udf").stdout.scan(/.+/)
  describe a do
    its("length") { should be > 0 }
  end
  a.each do |entry|
    describe entry do
      it { should_not match(/^udf\s+/) }
    end
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_1.1.2_Ensure_tmp_is_configured" do
  title "Ensure /tmp is configured"
  desc  "
    The /tmp directory is a world-writable directory used for temporary storage by all users and some applications.
    
    Rationale: Making /tmp its own file system allows an administrator to set the noexec option on the mount, making /tmp useless for an attacker to install executable code. It would also prevent an attacker from establishing a hardlink to a system setuid program and wait for it to be updated. Once the program was updated, the hardlink would be broken and the attacker would have his own copy of the program. If the program happened to have a security vulnerability, the attacker could continue to exploit the known flaw.
    
    This can be accomplished by either mounting tmpfs to /tmp, or creating a separate partition for /tmp.
  "
  impact 1.0
  describe mount("/tmp") do
    it { should be_mounted }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_1.1.3_Ensure_nodev_option_set_on_tmp_partition" do
  title "Ensure nodev option set on /tmp partition"
  desc  "
    The nodev mount option specifies that the filesystem cannot contain special devices.
    
    Rationale: Since the /tmp filesystem is not intended to support devices, set this option to ensure that users cannot attempt to create block or character special devices in /tmp .
  "
  impact 1.0
  describe mount("/tmp") do
    it { should be_mounted }
  end
  describe mount("/tmp") do
    its("options") { should include "nodev" }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_1.1.4_Ensure_nosuid_option_set_on_tmp_partition" do
  title "Ensure nosuid option set on /tmp partition"
  desc  "
    The nosuid mount option specifies that the filesystem cannot contain setuid files.
    
    Rationale: Since the /tmp filesystem is only intended for temporary file storage, set this option to ensure that users cannot create setuid files in /tmp .
  "
  impact 1.0
  describe mount("/tmp") do
    it { should be_mounted }
  end
  describe mount("/tmp") do
    its("options") { should include "nosuid" }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_1.1.5_Ensure_noexec_option_set_on_tmp_partition" do
  title "Ensure noexec option set on /tmp partition"
  desc  "
    The noexec mount option specifies that the filesystem cannot contain executable binaries.
    
    Rationale: Since the /tmp filesystem is only intended for temporary file storage, set this option to ensure that users cannot run executable binaries from /tmp .
  "
  impact 1.0
  describe mount("/tmp") do
    it { should be_mounted }
  end
  describe mount("/tmp") do
    its("options") { should include "noexec" }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_1.1.8_Ensure_nodev_option_set_on_vartmp_partition" do
  title "Ensure nodev option set on /var/tmp partition"
  desc  "
    The nodev mount option specifies that the filesystem cannot contain special devices.
    
    Rationale: Since the /var/tmp filesystem is not intended to support devices, set this option to ensure that users cannot attempt to create block or character special devices in /var/tmp .
  "
  impact 1.0
  describe mount("/var/tmp") do
    it { should be_mounted }
  end
  describe mount("/var/tmp") do
    its("options") { should include "nodev" }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_1.1.9_Ensure_nosuid_option_set_on_vartmp_partition" do
  title "Ensure nosuid option set on /var/tmp partition"
  desc  "
    The nosuid mount option specifies that the filesystem cannot contain setuid files.
    
    Rationale: Since the /var/tmp filesystem is only intended for temporary file storage, set this option to ensure that users cannot create setuid files in /var/tmp .
  "
  impact 1.0
  describe mount("/var/tmp") do
    it { should be_mounted }
  end
  describe mount("/var/tmp") do
    its("options") { should include "nosuid" }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_1.1.10_Ensure_noexec_option_set_on_vartmp_partition" do
  title "Ensure noexec option set on /var/tmp partition"
  desc  "
    The noexec mount option specifies that the filesystem cannot contain executable binaries.
    
    Rationale: Since the /var/tmp filesystem is only intended for temporary file storage, set this option to ensure that users cannot run executable binaries from /var/tmp .
  "
  impact 1.0
  describe mount("/var/tmp") do
    it { should be_mounted }
  end
  describe mount("/var/tmp") do
    its("options") { should include "noexec" }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_1.1.14_Ensure_nodev_option_set_on_home_partition" do
  title "Ensure nodev option set on /home partition"
  desc  "
    The nodev mount option specifies that the filesystem cannot contain special devices.
    
    Rationale: Since the user partitions are not intended to support devices, set this option to ensure that users cannot attempt to create block or character special devices.
  "
  impact 1.0
  describe mount("/home") do
    it { should be_mounted }
  end
  describe mount("/home") do
    its("options") { should include "nodev" }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_1.1.15_Ensure_nodev_option_set_on_devshm_partition" do
  title "Ensure nodev option set on /dev/shm partition"
  desc  "
    The nodev mount option specifies that the filesystem cannot contain special devices.
    
    Rationale: Since the /dev/shm filesystem is not intended to support devices, set this option to ensure that users cannot attempt to create special devices in /dev/shm partitions.
  "
  impact 1.0
  describe mount("/dev/shm") do
    it { should be_mounted }
  end
  describe mount("/dev/shm") do
    its("options") { should include "nodev" }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_1.1.16_Ensure_nosuid_option_set_on_devshm_partition" do
  title "Ensure nosuid option set on /dev/shm partition"
  desc  "
    The nosuid mount option specifies that the filesystem cannot contain setuid files.
    
    Rationale: Setting this option on a file system prevents users from introducing privileged programs onto the system and allowing non-root users to execute them.
  "
  impact 1.0
  describe mount("/dev/shm") do
    it { should be_mounted }
  end
  describe mount("/dev/shm") do
    its("options") { should include "nosuid" }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_1.1.17_Ensure_noexec_option_set_on_devshm_partition" do
  title "Ensure noexec option set on /dev/shm partition"
  desc  "
    The noexec mount option specifies that the filesystem cannot contain executable binaries.
    
    Rationale: Setting this option on a file system prevents users from executing programs from shared memory. This deters users from introducing potentially malicious software on the system.
  "
  impact 1.0
  describe mount("/dev/shm") do
    it { should be_mounted }
  end
  describe mount("/dev/shm") do
    its("options") { should include "noexec" }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_1.1.18_Ensure_nodev_option_set_on_removable_media_partitions" do
  title "Ensure nodev option set on removable media partitions"
  desc  "
    The nodev mount option specifies that the filesystem cannot contain special devices.
    
    Rationale: Removable media containing character and block special devices could be used to circumvent security controls by allowing non-root users to access sensitive device files such as /dev/kmem or the raw disk partitions.
  "
  impact 0.0
  describe "No tests defined for this control" do
    skip "No tests defined for this control"
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_1.1.19_Ensure_nosuid_option_set_on_removable_media_partitions" do
  title "Ensure nosuid option set on removable media partitions"
  desc  "
    The nosuid mount option specifies that the filesystem cannot contain setuid files.
    
    Rationale: Setting this option on a file system prevents users from introducing privileged programs onto the system and allowing non-root users to execute them.
  "
  impact 0.0
  describe "No tests defined for this control" do
    skip "No tests defined for this control"
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_1.1.20_Ensure_noexec_option_set_on_removable_media_partitions" do
  title "Ensure noexec option set on removable media partitions"
  desc  "
    The noexec mount option specifies that the filesystem cannot contain executable binaries.
    
    Rationale: Setting this option on a file system prevents users from executing programs from the removable media. This deters users from being able to introduce potentially malicious software on the system.
  "
  impact 0.0
  describe "No tests defined for this control" do
    skip "No tests defined for this control"
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_1.1.21_Ensure_sticky_bit_is_set_on_all_world-writable_directories" do
  title "Ensure sticky bit is set on all world-writable directories"
  desc  "
    Setting the sticky bit on world writable directories prevents users from deleting or renaming files in that directory that are not owned by them.
    
    Rationale: This feature prevents the ability to delete or rename files in world writable directories (such as /tmp ) that are owned by another user.
  "
  impact 1.0
  describe command('find / -path /proc -prune -o -type d \( -perm -0002 -a ! -perm -1000 \) -print 2>/dev/null') do
    its('stdout') { should be_empty }
    its('exit_status') { should eq 0 }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_1.1.22_Disable_Automounting" do
  title "Disable Automounting"
  desc  "
    autofs allows automatic mounting of devices, typically including CD/DVDs and USB drives.
    
    Rationale: With automounting enabled anyone with physical access could attach a USB drive or disc and have its contents available in system even if they lacked permissions to mount it themselves.
  "
  impact 1.0
  describe service("autofs") do
    it { should_not be_enabled }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_1.1.23_Disable_USB_Storage" do
  title "Disable USB Storage"
  desc  "
    USB storage provides a means to transfer and store files insuring persistence and availability of the files independent of network connection status.  Its popularity and utility has led to USB-based malware being a simple and common means for network infiltration and a first step to establishing a persistent threat within a networked environment.
    
    Rationale: Restricting USB access on the system will decrease the physical attack surface for a device and diminish the possible vectors to introduce malware.
  "
  impact 1.0
  a = command("modprobe -n -v usb-storage").stdout.scan(/.+/)
  describe a do
    its("length") { should be > 0 }
  end
  a.each do |entry|
    describe entry do
      it { should_not match(/^usb-storage\s+/) }
    end
  end
  a = command("modprobe -n -v usb-storage").stdout.scan(/.+/)
  describe a do
    its("length") { should be > 0 }
  end
  describe.one do
    a.each do |entry|
      describe entry do
        it { should match(/^install\s+\/bin\/true\s*$/) }
      end
    end
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_1.2.1_Ensure_Red_Hat_Subscription_Manager_connection_is_configured" do
  title "Ensure Red Hat Subscription Manager connection is configured"
  desc  "
    Systems need to be registered with the Red Hat Subscription Manager (RHSM) to receive patch updates. This is usually configured during initial installation.
    
    Rationale: It is important to register with the Red Hat Subscription Manager to make sure that patches are updated on a regular basis. This helps to reduce the exposure time as new vulnerabilities are discovered.
  "
  impact 0.0
  describe command('subscription-manager identity') do
    its(:stdout) { should include 'org name'}
    its(:stdout) { should include 'org ID'}
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_1.2.2_Disable_the_rhnsd_Daemon" do
  title "Disable the rhnsd Daemon"
  desc  "
    The rhnsd daemon polls the Red Hat Network web site for scheduled actions and, if there are, executes those actions.
    
    Rationale: Patch management policies may require that organizations test the impact of a patch before it is deployed in a production environment. Having patches automatically deployed could have a negative impact on the environment. It is best to not allow an action by default but only after appropriate consideration has been made. It is recommended that the service be disabled unless the risk is understood and accepted or you are running your own satellite . This item is not scored because organizations may have addressed the risk.
  "
  impact 0.0
  describe service('rhnsd') do
    it { should_not be_enabled }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_1.2.3_Ensure_GPG_keys_are_configured" do
  title "Ensure GPG keys are configured"
  desc  "
    Most packages managers implement GPG key signing to verify package integrity during installation.
    
    Rationale: It is important to ensure that updates are obtained from a valid source to protect against spoofing that could lead to the inadvertent installation of malware on the system.
  "
  impact 0.0
  describe "No tests defined for this control" do
    skip "No tests defined for this control"
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_1.2.4_Ensure_gpgcheck_is_globally_activated" do
  title "Ensure gpgcheck is globally activated"
  desc  "
    The gpgcheck option, found in the main section of the /etc/yum.conf and individual /etc/yum/repos.d/* files determines if an RPM package's signature is checked prior to its installation.
    
    Rationale: It is important to ensure that an RPM's package signature is always checked prior to installation to ensure that the software is obtained from a trusted source.
  "
  impact 1.0
  files = command("find /etc/yum.repos.d/ -type f -regex .\\*/.\\*").stdout.split
  describe files.delete_if { |f| command("file #{f} | cut -d: -f2").stdout =~ /binary|executable|archive/ || file(f).content =~ /^\s*gpgcheck\s*=\s*1\s*(\s+#.*)?$/ || file(f).content !~ /^\s*gpgcheck\s*=\s*[0-9]+\s*(\s+#.*)?$/ } do
    it { should be_empty }
  end
  describe file("/etc/yum.conf") do
    its("content") { should match(/^\s*gpgcheck\s*=\s*1\s*(\s+#.*)?$/) }
  end
  describe file("/etc/yum.conf") do
    its("content") { should_not match(/^\s*gpgcheck\s*=\s*[^1]\s*(\s+#.*)?$/) }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_1.2.5_Ensure_package_manager_repositories_are_configured" do
  title "Ensure package manager repositories are configured"
  desc  "
    Systems need to have package manager repositories configured to ensure they receive the latest patches and updates.
    
    Rationale: If a system's package repositories are misconfigured important patches may not be identified or a rogue repository could introduce compromised software.
  "
  impact 0.0
  describe "No tests defined for this control" do
    skip "No tests defined for this control"
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_1.3.1_Ensure_sudo_is_installed" do
  title "Ensure sudo is installed"
  desc  "
    sudo allows a permitted user to execute a command as the superuser or another user, as specified by the security policy.  The invoking user's real (not effective) user ID is used to determine the user name with which to query the security policy.
    
    Rationale: sudo supports a plugin architecture for security policies and input/output logging.  Third parties can develop and distribute their own policy and I/O logging plugins to work seamlessly with the sudo front end.  The default security policy is sudoers, which is configured via the file /etc/sudoers.
    
    The security policy determines what privileges, if any, a user has to run sudo.  The policy may require that users authenticate themselves with a password or another authentication mechanism.  If authentication is required, sudo will exit if the user's password is not entered within a configurable time limit.  This limit is policy-specific.
  "
  impact 1.0
  describe package("sudo") do
    it { should be_installed }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_1.3.2_Ensure_sudo_commands_use_pty" do
  title "Ensure sudo commands use pty"
  desc  "
    sudo can be configured to run only from a psuedo-pty
    
    Rationale: Attackers can run a malicious program using sudo which would fork a background process that remains even when the main program has finished executing.
  "
  impact 1.0
  describe.one do
    describe file("/etc/sudoers") do
      its("content") { should match(/^(?i)\s*Defaults\s+([^#\n\r]+,\s*)?use_pty(,\s+\S+\s*)*(\s+#.*)?$/) }
    end
    files = command("find /etc/sudoers.d/ -type f -regex .\\*/\\^.\\+\\$").stdout.split
    describe files.delete_if { |f| command("file #{f} | cut -d: -f2").stdout =~ /binary|executable|archive/ || file(f).content !~ /^(?i)\s*Defaults\s+([^#\n\r]+,\s*)?use_pty(,\s+\S+\s*)*(\s+#.*)?$/ } do
      it { should_not be_empty }
    end
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_1.3.3_Ensure_sudo_log_file_exists" do
  title "Ensure sudo log file exists"
  desc  "
    sudo can use a custom log file
    
    Rationale: A sudo log file simplifies auditing of sudo commands
  "
  impact 1.0
  describe.one do
    describe file("/etc/sudoers") do
      its("content") { should match(/^(?i)\h*Defaults\h+([^#\n\r]+,\h*)?logfile\h*=\h*"?\H+"?\h*((,|\h+).*)?$/) }
    end
    files = command("find /etc/sudoers.d -type f -regex .\\*/\\^.\\+\\$").stdout.split
    describe files.delete_if { |f| command("file #{f} | cut -d: -f2").stdout =~ /binary|executable|archive/ || file(f).content !~ /^(?i)\h*Defaults\h+([^#\n\r]+,\h*)?logfile\h*=\h*"?\H+"?\h*((,|\h+).*)?$/ } do
      it { should_not be_empty }
    end
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_1.4.1_Ensure_AIDE_is_installed" do
  title "Ensure AIDE is installed"
  desc  "
    AIDE takes a snapshot of filesystem state including modification times, permissions, and file hashes which can then be used to compare against the current state of the filesystem to detect modifications to the system.
    
    Rationale: By monitoring the filesystem state compromised files can be detected to prevent or limit the exposure of accidental or malicious misconfigurations or modified binaries.
  "
  impact 1.0
  describe package("aide") do
    it { should be_installed }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_1.4.2_Ensure_filesystem_integrity_is_regularly_checked" do
  title "Ensure filesystem integrity is regularly checked"
  desc  "
    Periodic checking of the filesystem integrity is needed to detect changes to the filesystem.
    
    Rationale: Periodic file checking allows the system administrator to determine on a regular basis if critical files have been changed in an unauthorized fashion.
  "
  impact 1.0
  if service('aidecheck.service').enabled? && service('aidecheck.timer').enabled?
  	describe service('aidecheck.service') do
  		it { should be_enabled }
  	end
  	describe service('aidecheck.timer') do
  		it { should be_enabled }
  	end
  else
  	describe.one do
  		describe crontab do
  			its('commands') { should include '/usr/sbin/aide --check' }
  		end
  		crontab_path = ['/etc/cron.hourly/', '/etc/cron.daily/', '/etc/cron.weekly/', '/etc/cron.monthly/', '/etc/cron.d/']
  		all_cron_files = Hash.new
  		crontab_path.map { |path| all_cron_files[path] = command("ls #{path}").stdout.split("\n") }
  		all_cron_files.each do |cron_path, cron_files|
  			unless cron_files.empty?
  				cron_files.each do |cron_file|
  					temp = file(cron_path+cron_file)
  					describe temp do
  						its('content') { should include 'aide --check'}
  					end
  				end
  			end
  		end
  	end
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_1.5.1_Ensure_permissions_on_bootloader_config_are_configured" do
  title "Ensure permissions on bootloader config are configured"
  desc  "
    The grub configuration file contains information on boot settings and passwords for unlocking boot options.
    
    The grub configuration is usually grub.cfg and grubenv stored in /boot/grub2/`
    
    Rationale: Setting the permissions to read and write for root only prevents non-root users from seeing the boot parameters or changing them. Non-root users who read the boot parameters may be able to identify weaknesses in security upon boot and be able to exploit them.
  "
  impact 1.0
  describe file("/boot/grub2/grub.cfg") do
    it { should exist }
  end
  describe file("/boot/grub2/grub.cfg") do
    it { should_not be_executable.by "group" }
  end
  describe file("/boot/grub2/grub.cfg") do
    it { should_not be_readable.by "group" }
  end
  describe file("/boot/grub2/grub.cfg") do
    its("gid") { should cmp 0 }
  end
  describe file("/boot/grub2/grub.cfg") do
    it { should_not be_writable.by "group" }
  end
  describe file("/boot/grub2/grub.cfg") do
    it { should_not be_executable.by "other" }
  end
  describe file("/boot/grub2/grub.cfg") do
    it { should_not be_readable.by "other" }
  end
  describe file("/boot/grub2/grub.cfg") do
    it { should_not be_writable.by "other" }
  end
  describe file("/boot/grub2/grub.cfg") do
    its("uid") { should cmp 0 }
  end
  describe file("/boot/grub2/grubenv") do
    it { should exist }
  end
  describe file("/boot/grub2/grubenv") do
    it { should_not be_executable.by "group" }
  end
  describe file("/boot/grub2/grubenv") do
    it { should_not be_readable.by "group" }
  end
  describe file("/boot/grub2/grubenv") do
    its("gid") { should cmp 0 }
  end
  describe file("/boot/grub2/grubenv") do
    it { should_not be_writable.by "group" }
  end
  describe file("/boot/grub2/grubenv") do
    it { should_not be_executable.by "other" }
  end
  describe file("/boot/grub2/grubenv") do
    it { should_not be_readable.by "other" }
  end
  describe file("/boot/grub2/grubenv") do
    it { should_not be_writable.by "other" }
  end
  describe file("/boot/grub2/grubenv") do
    its("uid") { should cmp 0 }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_1.5.2_Ensure_bootloader_password_is_set" do
  title "Ensure bootloader password is set"
  desc  "
    Setting the boot loader password will require that anyone rebooting the system must enter a password before being able to set command line boot parameters
    
    Rationale: Requiring a boot password upon execution of the boot loader will prevent an unauthorized user from entering boot parameters or changing the boot partition. This prevents users from weakening security (e.g. turning off SELinux at boot time).
  "
  impact 1.0
  describe file("/boot/grub2/user.cfg") do
    its("content") { should match(/^\s*GRUB2_PASSWORD\s*=\s*.+$/) }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_1.5.3_Ensure_authentication_required_for_single_user_mode" do
  title "Ensure authentication required for single user mode"
  desc  "
    Single user mode (rescue mode) is used for recovery when the system detects an issue during boot or by manual selection from the bootloader.
    
    Rationale: Requiring authentication in single user mode (rescue mode) prevents an unauthorized user from rebooting the system into single user to gain root privileges without credentials.
  "
  impact 1.0
  describe file("/usr/lib/systemd/system/emergency.service") do
    its("content") { should match(/^\s*ExecStart=-\/usr\/lib\/systemd\/systemd-sulogin-shell(\s+emergency|\s*)\s*(\s+#.*)?$/) }
  end
  describe file("/usr/lib/systemd/system/rescue.service") do
    its("content") { should match(/^\s*ExecStart=-\/usr\/lib\/systemd\/systemd-sulogin-shell(\s+rescue\s*|\s*)\s*(\s+#.*)?$/) }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_1.6.1_Ensure_core_dumps_are_restricted" do
  title "Ensure core dumps are restricted"
  desc  "
    A core dump is the memory of an executable program. It is generally used to determine why a program aborted. It can also be used to glean confidential information from a core file. The system provides the ability to set a soft limit for core dumps, but this can be overridden by the user.
    
    Rationale: Setting a hard limit on core dumps prevents users from overriding the soft variable. If core dumps are required, consider setting limits for user groups (see limits.conf(5) ). In addition, setting the fs.suid_dumpable variable to 0 will prevent setuid programs from dumping core.
  "
  impact 1.0
  describe.one do
    describe file("/etc/security/limits.conf") do
      its("content") { should match(/^\s*\*\s+hard\s+core\s+0\s*(\s+#.*)?$/) }
    end
    files = command("find /etc/security/limits.d -type f -regex .\\*/.\\*").stdout.split
    describe files.delete_if { |f| command("file #{f} | cut -d: -f2").stdout =~ /binary|executable|archive/ || file(f).content !~ /^\s*\*\s+hard\s+core\s+0\s*(\s+#.*)?$/ } do
      it { should_not be_empty }
    end
  end
  describe bash("#!/usr/bin/env sh\n\n#\n# CIS-CAT Script Check Engine\n#\n# Name         Date       Description\n# -------------------------------------------------------------------\n# E. Pinnell   10/15/19   Check sysctl running configuration\n\nsysctl -a | grep -Eq \"$XCCDF_VALUE_REGEX\" && passing=true\n\n# If the regex matched, output would be generated.  If so, we pass\nif [ \"$passing\" = true ] ; then\n\techo \"sysctl parameter is: $(sysctl -a | grep -E \"$XCCDF_VALUE_REGEX\")\"\n    exit 0\nelse\n    # print the reason why we are failing\n    echo \"Missing sysctl parameter.\"\n    exit 1\nfi") do
    its("exit_status") { should eq 0 }
  end
  describe.one do
    describe file("/etc/sysctl.conf") do
      its("content") { should match(/^\s*fs\.suid_dumpable\s*=\s*0\s*(\s+#.*)?$/) }
    end
    files = command("find /etc/sysctl.d -type f -regex .\\*/.\\*").stdout.split
    describe files.delete_if { |f| command("file #{f} | cut -d: -f2").stdout =~ /binary|executable|archive/ || file(f).content !~ /^\s*fs\.suid_dumpable\s*=\s*0\s*(\s+#.*)?$/ } do
      it { should_not be_empty }
    end
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_1.6.2_Ensure_address_space_layout_randomization_ASLR_is_enabled" do
  title "Ensure address space layout randomization (ASLR) is enabled"
  desc  "
    Address space layout randomization (ASLR) is an exploit mitigation technique which randomly arranges the address space of key data areas of a process.
    
    Rationale: Randomly placing virtual memory regions will make it difficult to write memory page exploits as the memory placement will be consistently shifting.
  "
  impact 1.0
  describe kernel_parameter("kernel.randomize_va_space") do
    its("value") { should eq 2 }
  end
  describe.one do
    describe file("/etc/sysctl.conf") do
      its("content") { should match(/^\s*kernel.randomize_va_space\s*=\s*2$/) }
    end
    files = command("find /etc/sysctl.d/ -type f -regex .\\*/.\\*").stdout.split
    describe files.delete_if { |f| command("file #{f} | cut -d: -f2").stdout =~ /binary|executable|archive/ || file(f).content =~ /^\s*kernel.randomize_va_space\s*=\s*2\s*(\s+#.*)?$/ || file(f).content !~ /^\s*kernel.randomize_va_space\s*=\s*[0-9]+\s*(\s+#.*)?$/ } do
      it { should be_empty }
    end
    files = command("find /usr/lib/sysctl.d/ -type f -regex .\\*/.\\*").stdout.split
    describe files.delete_if { |f| command("file #{f} | cut -d: -f2").stdout =~ /binary|executable|archive/ || file(f).content =~ /^\s*kernel.randomize_va_space\s*=\s*2\s*(\s+#.*)?$/ || file(f).content !~ /^\s*kernel.randomize_va_space\s*=\s*[0-9]+\s*(\s+#.*)?$/ } do
      it { should be_empty }
    end
    files = command("find /run/sysctl.d/ -type f -regex .\\*/.\\*").stdout.split
    describe files.delete_if { |f| command("file #{f} | cut -d: -f2").stdout =~ /binary|executable|archive/ || file(f).content =~ /^\s*kernel.randomize_va_space\s*=\s*2\s*(\s+#.*)?$/ || file(f).content !~ /^\s*kernel.randomize_va_space\s*=\s*[0-9]+\s*(\s+#.*)?$/ } do
      it { should be_empty }
    end
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_1.8.1.1_Ensure_message_of_the_day_is_configured_properly" do
  title "Ensure message of the day is configured properly"
  desc  "
    The contents of the /etc/motd file are displayed to users after login and function as a message of the day for authenticated users.
    
    Unix-based systems have typically displayed information about the OS release and patch level upon logging in to the system. This information can be useful to developers who are developing software for a particular OS platform. If mingetty(8) supports the following options, they display operating system information: \\m - machine architecture \\r - operating system release \\s - operating system name \\v - operating system version
    
    Rationale: Warning messages inform users who are attempting to login to the system of their legal status regarding the system and must include the name of the organization that owns the system and any monitoring policies that are in place. Displaying OS and patch level information in login banners also has the side effect of providing detailed system information to attackers attempting to target specific exploits of a system. Authorized users can easily get this information by running the \" uname -a \" command once they have logged in.
  "
  impact 1.0
  describe file('/etc/motd') do
    its('content') { should_not match(/(\\v|\\r|\\m|\\s|[Rr][Hh][Ee][Ll])/) }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_1.8.1.2_Ensure_local_login_warning_banner_is_configured_properly" do
  title "Ensure local login warning banner is configured properly"
  desc  "
    The contents of the /etc/issue file are displayed to users prior to login for local terminals.
    
    Unix-based systems have typically displayed information about the OS release and patch level upon logging in to the system. This information can be useful to developers who are developing software for a particular OS platform. If mingetty(8) supports the following options, they display operating system information: \\m - machine architecture \\r - operating system release \\s - operating system name \\v - operating system version - or the operating system's name
    
    Rationale: Warning messages inform users who are attempting to login to the system of their legal status regarding the system and must include the name of the organization that owns the system and any monitoring policies that are in place. Displaying OS and patch level information in login banners also has the side effect of providing detailed system information to attackers attempting to target specific exploits of a system. Authorized users can easily get this information by running the \" uname -a \" command once they have logged in.
  "
  impact 1.0
  describe file('/etc/issue') do
    its('content') { should_not match(/(\\v|\\r|\\m|\\s|[Rr][Hh][Ee][Ll])/) }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_1.8.1.3_Ensure_remote_login_warning_banner_is_configured_properly" do
  title "Ensure remote login warning banner is configured properly"
  desc  "
    The contents of the /etc/issue.net file are displayed to users prior to login for remote connections from configured services.
    
    Unix-based systems have typically displayed information about the OS release and patch level upon logging in to the system. This information can be useful to developers who are developing software for a particular OS platform. If mingetty(8) supports the following options, they display operating system information: \\m - machine architecture \\r - operating system release \\s - operating system name \\v - operating system version
    
    Rationale: Warning messages inform users who are attempting to login to the system of their legal status regarding the system and must include the name of the organization that owns the system and any monitoring policies that are in place. Displaying OS and patch level information in login banners also has the side effect of providing detailed system information to attackers attempting to target specific exploits of a system. Authorized users can easily get this information by running the \" uname -a \" command once they have logged in.
  "
  impact 1.0
  describe file('/etc/issue.net') do
    its('content') { should_not match(/(\\v|\\r|\\m|\\s|[Rr][Hh][Ee][Ll])/) }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_1.8.1.4_Ensure_permissions_on_etcmotd_are_configured" do
  title "Ensure permissions on /etc/motd are configured"
  desc  "
    The contents of the /etc/motd file are displayed to users after login and function as a message of the day for authenticated users.
    
    Rationale: If the /etc/motd file does not have the correct ownership it could be modified by unauthorized users with incorrect or misleading information.
  "
  impact 1.0
  describe file("/etc/motd") do
  	it { should exist }
  	it { should_not be_executable.by "group" }
  	it { should be_readable.by "group" }
  	its("gid") { should cmp 0 }
  	it { should_not be_writable.by "group" }
  	it { should_not be_executable.by "other" }
  	it { should be_readable.by "other" }
  	it { should_not be_writable.by "other" }
  	it { should_not be_setgid }
  	it { should_not be_sticky }
  	it { should_not be_setuid }
  	it { should_not be_executable.by "owner" }
  	it { should be_readable.by "owner" }
  	its("uid") { should cmp 0 }
  	it { should be_writable.by "owner" }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_1.8.1.5_Ensure_permissions_on_etcissue_are_configured" do
  title "Ensure permissions on /etc/issue are configured"
  desc  "
    The contents of the /etc/issue file are displayed to users prior to login for local terminals.
    
    Rationale: If the /etc/issue file does not have the correct ownership it could be modified by unauthorized users with incorrect or misleading information.
  "
  impact 1.0
  describe file("/etc/issue") do
    it { should exist }
  end
  describe file("/etc/issue") do
    it { should_not be_executable.by "group" }
  end
  describe file("/etc/issue") do
    its("gid") { should cmp 0 }
  end
  describe file("/etc/issue") do
    it { should_not be_writable.by "group" }
  end
  describe file("/etc/issue") do
    it { should_not be_executable.by "other" }
  end
  describe file("/etc/issue") do
    it { should_not be_writable.by "other" }
  end
  describe file("/etc/issue") do
    it { should_not be_setgid }
  end
  describe file("/etc/issue") do
    it { should_not be_sticky }
  end
  describe file("/etc/issue") do
    it { should_not be_setuid }
  end
  describe file("/etc/issue") do
    it { should_not be_executable.by "owner" }
  end
  describe file("/etc/issue") do
    its("uid") { should cmp 0 }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_1.8.1.6_Ensure_permissions_on_etcissue.net_are_configured" do
  title "Ensure permissions on /etc/issue.net are configured"
  desc  "
    The contents of the /etc/issue.net file are displayed to users prior to login for remote connections from configured services.
    
    Rationale: If the /etc/issue.net file does not have the correct ownership it could be modified by unauthorized users with incorrect or misleading information.
  "
  impact 1.0
  describe file("/etc/issue.net") do
    it { should exist }
  end
  describe file("/etc/issue.net") do
    it { should_not be_executable.by "group" }
  end
  describe file("/etc/issue.net") do
    its("gid") { should cmp 0 }
  end
  describe file("/etc/issue.net") do
    it { should_not be_writable.by "group" }
  end
  describe file("/etc/issue.net") do
    it { should_not be_executable.by "other" }
  end
  describe file("/etc/issue.net") do
    it { should_not be_writable.by "other" }
  end
  describe file("/etc/issue.net") do
    it { should_not be_setgid }
  end
  describe file("/etc/issue.net") do
    it { should_not be_sticky }
  end
  describe file("/etc/issue.net") do
    it { should_not be_setuid }
  end
  describe file("/etc/issue.net") do
    it { should_not be_executable.by "owner" }
  end
  describe file("/etc/issue.net") do
    its("uid") { should cmp 0 }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_1.8.2_Ensure_GDM_login_banner_is_configured" do
  title "Ensure GDM login banner is configured"
  desc  "
    GDM is the GNOME Display Manager which handles graphical login for GNOME based systems.
    
    Rationale: Warning messages inform users who are attempting to login to the system of their legal status regarding the system and must include the name of the organization that owns the system and any monitoring policies that are in place.
  "
  impact 1.0
  describe.one do
    describe file("/etc/gdm/greeter.dconf-defaults") do
      its("content") { should match(/^\[org\/gnome\/login-screen\]$/) }
    end
    describe file("/etc/gdm/greeter.dconf-defaults") do
      its("content") { should match(/^banner-message-enable=true$/) }
    end
    describe file("/etc/gdm/greeter.dconf-defaults") do
      its("content") { should match(/^banner-message-text='.+'$/) }
    end
    describe package("gdm") do
      it { should_not be_installed }
    end
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_1.9_Ensure_updates_patches_and_additional_security_software_are_installed" do
  title "Ensure updates, patches, and additional security software are installed"
  desc  "
    Periodically patches are released for included software either due to security flaws or to include additional functionality.
    
    Rationale: Newer patches may contain security enhancements that would not be available through the latest full update. As a result, it is recommended that the latest software patches be used to take advantage of the latest functionality. As with any software installation, organizations need to determine if a given update meets their requirements and verify the compatibility and supportability of any additional software against the update revision that is selected.
  "
  impact 0.0
  describe command('dnf check-update --security') do
    its('stdout') { should include "currently running version" }
    its('exit_status') { should eq 0 }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_1.10_Ensure_system-wide_crypto_policy_is_not_legacy" do
  title "Ensure system-wide crypto policy is not legacy"
  desc  "
    The system-wide crypto-policies followed by the crypto core components allow consistently deprecating and disabling algorithms system-wide.
    
    The individual policy levels (DEFAULT, LEGACY, FUTURE, and FIPS) are included in the crypto-policies(7) package.
    
    Rationale: If the Legacy system-wide crypto policy is selected, it includes support for TLS 1.0, TLS 1.1, and SSH2 protocols or later. The algorithms DSA, 3DES, and RC4 are allowed, while RSA and Diffie-Hellman parameters are accepted if larger than 1023-bits.
    
    These legacy protocols and algorithms can make the system vulnerable to attacks, including those listed in RFC 7457
  "
  impact 1.0
  describe file("/etc/crypto-policies/config") do
    its("content") { should_not match(/^\s*(?i)LEGACY\s*(\s+#.*)?$/) }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_2.1.1_Ensure_xinetd_is_not_installed" do
  title "Ensure xinetd is not installed"
  desc  "
    The eXtended InterNET Daemon ( xinetd ) is an open source super daemon that replaced the original inetd daemon. The xinetd daemon listens for well known services and dispatches the appropriate daemon to properly respond to service requests.
    
    Rationale: If there are no xinetd services required, it is recommended that the package be removed.
  "
  impact 1.0
  describe package("xinetd") do
    it { should_not be_installed }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_2.2.1.1_Ensure_time_synchronization_is_in_use" do
  title "Ensure time synchronization is in use"
  desc  "
    System time should be synchronized between all systems in an environment. This is typically done by establishing an authoritative time server or set of servers and having all systems synchronize their clocks to them.
    
    Rationale: Time synchronization is important to support time sensitive security mechanisms like Kerberos and also ensures log files have consistent time records across the enterprise, which aids in forensic investigations.
  "
  impact 0.0
  describe package("chrony") do
    it { should be_installed }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_2.2.1.2_Ensure_chrony_is_configured" do
  title "Ensure chrony is configured"
  desc  "
    chrony is a daemon which implements the Network Time Protocol (NTP) and is designed to synchronize system clocks across a variety of systems and use a source that is highly accurate. More information on chrony can be found at [http://chrony.tuxfamily.org/](http://chrony.tuxfamily.org/) . chrony can be configured to be a client and/or a server.
    
    Rationale: If chrony is in use on the system proper configuration is vital to ensuring time synchronization is working properly.
    
    This recommendation only applies if chrony is in use on the system.
  "
  impact 1.0
  describe.one do
    describe file("/etc/chrony.conf") do
      its("content") { should match(/^\s*(server|pool)\s+\S+/) }
    end
    processes(/^chronyd/).where { pid > 0 }.entries.each do |entry|
      a = passwd.where { user == "chrony" }.uids.first
      describe user(entry.user) do
        its("uid") { should cmp a }
      end
    end
    describe package("chrony") do
      it { should_not be_installed }
    end
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_2.2.2_Ensure_X_Window_System_is_not_installed" do
  title "Ensure X Window System is not installed"
  desc  "
    The X Window System provides a Graphical User Interface (GUI) where users can have multiple windows in which to run programs and various add on. The X Windows system is typically used on workstations where users login, but not on servers where users typically do not login.
    
    Rationale: Unless your organization specifically requires graphical login access via X Windows, remove it to reduce the potential attack surface.
  "
  impact 1.0
  describe packages(/^xorg-x11-server-*/) do
    its("entries") { should be_empty }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_2.2.3_Ensure_rsync_service_is_not_enabled" do
  title "Ensure rsync service is not enabled"
  desc  "
    The rsyncd service can be used to synchronize files between systems over network links.
    
    Rationale: The rsyncd service presents a security risk as it uses unencrypted protocols for communication.
  "
  impact 1.0
  describe service("rsyncd") do
    it { should_not be_enabled }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_2.2.4_Ensure_Avahi_Server_is_not_enabled" do
  title "Ensure Avahi Server is not enabled"
  desc  "
    Avahi is a free zeroconf implementation, including a system for multicast DNS/DNS-SD service discovery. Avahi allows programs to publish and discover services and hosts running on a local network with no specific configuration. For example, a user can plug a computer into a network and Avahi automatically finds printers to print to, files to look at and people to talk to, as well as network services running on the machine.
    
    Rationale: Automatic discovery of network services is not normally required for system functionality. It is recommended to disable the service to reduce the potential attack surface.
  "
  impact 1.0
  describe service("avahi-daemon") do
    it { should_not be_enabled }
  end
  describe service("avahi-daemon.socket") do
    it { should_not be_enabled }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_2.2.5_Ensure_SNMP_Server_is_not_enabled" do
  title "Ensure SNMP Server is not enabled"
  desc  "
    The Simple Network Management Protocol (SNMP) server is used to listen for SNMP commands from an SNMP management system, execute the commands or collect the information and then send results back to the requesting system.
    
    Rationale: The SNMP server can communicate using SNMP v1, which transmits data in the clear and does not require authentication to execute commands.  Unless absolutely necessary, it is recommended that the SNMP service not be used.  If SNMP is required the server should be configured to disallow SNMP v1.
  "
  impact 1.0
  describe service("snmpd") do
    it { should_not be_enabled }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_2.2.6_Ensure_HTTP_Proxy_Server_is_not_enabled" do
  title "Ensure HTTP Proxy Server is not enabled"
  desc  "
    Squid is a standard proxy server used in many distributions and environments.
    
    Rationale: If there is no need for a proxy server, it is recommended that the squid proxy be deleted to reduce the potential attack surface.
  "
  impact 1.0
  describe service("squid") do
    it { should_not be_enabled }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_2.2.7_Ensure_Samba_is_not_enabled" do
  title "Ensure Samba is not enabled"
  desc  "
    The Samba daemon allows system administrators to configure their Linux systems to share file systems and directories with Windows desktops. Samba will advertise the file systems and directories via the Server Message Block (SMB) protocol. Windows desktop users will be able to mount these directories and file systems as letter drives on their systems.
    
    Rationale: If there is no need to mount directories and file systems to Windows systems, then this service can be deleted to reduce the potential attack surface.
  "
  impact 1.0
  describe service("smb") do
    it { should_not be_enabled }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_2.2.8_Ensure_IMAP_and_POP3_server_is_not_enabled" do
  title "Ensure IMAP and POP3 server is not enabled"
  desc  "
    dovecot is an open source IMAP and POP3 server for Linux based systems.
    
    Rationale: Unless POP3 and/or IMAP servers are to be provided by this system, it is recommended that the service be deleted to reduce the potential attack surface.
  "
  impact 1.0
  describe service("dovecot") do
    it { should_not be_enabled }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_2.2.9_Ensure_HTTP_server_is_not_enabled" do
  title "Ensure HTTP server is not enabled"
  desc  "
    HTTP or web servers provide the ability to host web site content.
    
    Rationale: Unless there is a need to run the system as a web server, it is recommended that the package be deleted to reduce the potential attack surface.
  "
  impact 1.0
  describe service("httpd") do
    it { should_not be_enabled }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_2.2.10_Ensure_FTP_Server_is_not_enabled" do
  title "Ensure FTP Server is not enabled"
  desc  "
    The File Transfer Protocol (FTP) provides networked computers with the ability to transfer files.
    
    Rationale: FTP does not protect the confidentiality of data or authentication credentials. It is recommended SFTP be used if file transfer is required. Unless there is a need to run the system as a FTP server (for example, to allow anonymous downloads), it is recommended that the package be deleted to reduce the potential attack surface.
  "
  impact 1.0
  describe service("vsftpd") do
    it { should_not be_enabled }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_2.2.11_Ensure_DNS_Server_is_not_enabled" do
  title "Ensure DNS Server is not enabled"
  desc  "
    The Domain Name System (DNS) is a hierarchical naming system that maps names to IP addresses for computers, services and other resources connected to a network.
    
    Rationale: Unless a system is specifically designated to act as a DNS server, it is recommended that the package be deleted to reduce the potential attack surface.
  "
  impact 1.0
  describe service("named") do
    it { should_not be_enabled }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_2.2.12_Ensure_NFS_is_not_enabled" do
  title "Ensure NFS is not enabled"
  desc  "
    The Network File System (NFS) is one of the first and most widely distributed file systems in the UNIX environment. It provides the ability for systems to mount file systems of other servers through the network.
    
    Rationale: If the system does not export NFS shares, it is recommended that the NFS be disabled to reduce the remote attack surface.
  "
  impact 1.0
  describe service("nfs-server") do
    it { should_not be_enabled }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_2.2.13_Ensure__RPC_is_not_enabled" do
  title "Ensure  RPC is not enabled"
  desc  "
    The rpcbind service maps Remote Procedure Call (RPC) services to the ports on which they listen. RPC
    processes notify rpcbind when they start, registering the ports they are listening on and the RPC
    program numbers they expect to serve. The client system then contacts rpcbind on the server with a
    particular RPC program number. The rpcbind service redirects the client to the proper port number so it
    can communicate with the requested service.
    
    Rationale: If the system does not require rpc based services, it is recommended that rpcbind be disabled to reduce the remote attack surface.
  "
  impact 1.0
  describe service("rpcbind") do
    it { should_not be_enabled }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_2.2.14_Ensure_LDAP_server_is_not_enabled" do
  title "Ensure LDAP server is not enabled"
  desc  "
    The Lightweight Directory Access Protocol (LDAP) was introduced as a replacement for NIS/YP. It is a service that provides a method for looking up information from a central database.
    
    Rationale: If the system will not need to act as an LDAP server, it is recommended that the software be disabled to reduce the potential attack surface.
  "
  impact 1.0
  describe service("slapd") do
    it { should_not be_enabled }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_2.2.15_Ensure_DHCP_Server_is_not_enabled" do
  title "Ensure DHCP Server is not enabled"
  desc  "
    The Dynamic Host Configuration Protocol (DHCP) is a service that allows machines to be dynamically assigned IP addresses.
    
    Rationale: Unless a system is specifically set up to act as a DHCP server, it is recommended that this service be deleted to reduce the potential attack surface.
  "
  impact 1.0
  describe service("dhcpd") do
    it { should_not be_enabled }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_2.2.16_Ensure_CUPS_is_not_enabled" do
  title "Ensure CUPS is not enabled"
  desc  "
    The Common Unix Print System (CUPS) provides the ability to print to both local and network printers. A system running CUPS can also accept print jobs from remote systems and print them to local printers. It also provides a web based remote administration capability.
    
    Rationale: If the system does not need to print jobs or accept print jobs from other systems, it is recommended that CUPS be disabled to reduce the potential attack surface.
  "
  impact 1.0
  describe service("cups") do
    it { should_not be_enabled }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_2.2.17_Ensure_NIS_Server_is_not_enabled" do
  title "Ensure NIS Server is not enabled"
  desc  "
    The Network Information Service (NIS) (formally known as Yellow Pages) is a client-server directory service protocol for distributing system configuration files. The NIS server is a collection of programs that allow for the distribution of configuration files.
    
    Rationale: The NIS service is inherently an insecure system that has been vulnerable to DOS attacks, buffer overflows and has poor authentication for querying NIS maps. NIS generally has been replaced by such protocols as Lightweight Directory Access Protocol (LDAP). It is recommended that the service be disabled and other, more secure services be used
  "
  impact 1.0
  describe service("ypserv") do
    it { should_not be_enabled }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_2.2.18_Ensure_mail_transfer_agent_is_configured_for_local-only_mode" do
  title "Ensure mail transfer agent is configured for local-only mode"
  desc  "
    Mail Transfer Agents (MTA), such as sendmail and Postfix, are used to listen for incoming mail and transfer the messages to the appropriate user or mail server. If the system is not intended to be a mail server, it is recommended that the MTA be configured to only process local mail.
    
    Rationale: The software for all Mail Transfer Agents is complex and most have a long history of security issues. While it is important to ensure that the system can process local mail messages, it is not necessary to have the MTA's daemon listening on a port unless the server is intended to be a mail server that receives and processes mail from other systems.
  "
  impact 1.0
  describe port(25).where { protocol =~ /.*/ && address =~ /^(?!127\.0\.0\.1|::1).*$/ } do
    its("entries") { should be_empty }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_2.3.1_Ensure_NIS_Client_is_not_installed" do
  title "Ensure NIS Client is not installed"
  desc  "
    The Network Information Service (NIS), formerly known as Yellow Pages, is a client-server directory service protocol used to distribute system configuration files. The NIS client ( ypbind ) was used to bind a machine to an NIS server and receive the distributed configuration files.
    
    Rationale: The NIS service is inherently an insecure system that has been vulnerable to DOS attacks, buffer overflows and has poor authentication for querying NIS maps. NIS generally has been replaced by such protocols as Lightweight Directory Access Protocol (LDAP). It is recommended that the service be removed.
  "
  impact 1.0
  describe package("ypbind") do
    it { should_not be_installed }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_2.3.2_Ensure_telnet_client_is_not_installed" do
  title "Ensure telnet client is not installed"
  desc  "
    The telnet package contains the telnet client, which allows users to start connections to other systems via the telnet protocol.
    
    Rationale: The telnet protocol is insecure and unencrypted. The use of an unencrypted transmission medium could allow an unauthorized user to steal credentials. The ssh package provides an encrypted session and stronger security and is included in most Linux distributions.
  "
  impact 1.0
  describe package("telnet") do
    it { should_not be_installed }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_2.3.3_Ensure_LDAP_client_is_not_installed" do
  title "Ensure LDAP client is not installed"
  desc  "
    The Lightweight Directory Access Protocol (LDAP) was introduced as a replacement for NIS/YP. It is a service that provides a method for looking up information from a central database.
    
    Rationale: If the system will not need to act as an LDAP client, it is recommended that the software be removed to reduce the potential attack surface.
  "
  impact 1.0
  describe package("openldap-clients") do
    it { should_not be_installed }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_3.1.1_Ensure_IP_forwarding_is_disabled" do
  title "Ensure IP forwarding is disabled"
  desc  "
    The net.ipv4.ip_forward and net.ipv6.conf.all.forwarding flags are used to tell the system whether it can forward packets or not.
    
    Rationale: Setting the flags to 0 ensures that a system with multiple interfaces (for example, a hard proxy), will never be able to forward packets, and therefore, never serve as a router.
  "
  impact 1.0
  describe kernel_parameter("net.ipv4.ip_forward") do
  	its("value") { should eq 0 }
  end
  describe.one do
  	describe file("/etc/sysctl.conf") do
  		its("content") { should_not match(/^\s*net.ipv4.ip_forward\s*=\s*1$/) }
  	end
  	files = command("find /etc/sysctl.d -type f -regex .\\*/.\\*").stdout.split
  	describe files.delete_if { |f| command("file #{f} | cut -d: -f2").stdout =~ /binary|executable|archive/ || file(f).content !~ /^\s*net.ipv4.ip_forward\s*=\s*1$/ } do
  		it { should be_empty }
  	end
  	files = command("find /usr/lib/sysctl.d -type f -regex .\\*/.\\*").stdout.split
  	describe files.delete_if { |f| command("file #{f} | cut -d: -f2").stdout =~ /binary|executable|archive/ || file(f).content !~ /^\s*net.ipv4.ip_forward\s*=\s*1$/ } do
  		it { should be_empty }
  	end
  	files = command("find /run/sysctl.d -type f -regex .\\*/.\\*").stdout.split
  	describe files.delete_if { |f| command("file #{f} | cut -d: -f2").stdout =~ /binary|executable|archive/ || file(f).content !~ /^\s*net.ipv4.ip_forward\s*=\s*1$/ } do
  		it { should be_empty }
  	end
  end
  describe kernel_parameter("net.ipv6.conf.all.forwarding") do
  	its("value") { should eq 0 }
  end
  describe.one do
  	describe file("/etc/sysctl.conf") do
  		its("content") { should_not match(/^\s*net.ipv6.conf.all.forwarding\s*=\s*1$/) }
  	end
  	files = command("find /etc/sysctl.d -type f -regex .\\*/.\\*").stdout.split
  	describe files.delete_if { |f| command("file #{f} | cut -d: -f2").stdout =~ /binary|executable|archive/ || file(f).content !~ /^\s*net.ipv6.conf.all.forwarding\s*=\s*1$/ } do
  		it { should be_empty }
  	end
  	files = command("find /usr/lib/sysctl.d -type f -regex .\\*/.\\*").stdout.split
  	describe files.delete_if { |f| command("file #{f} | cut -d: -f2").stdout =~ /binary|executable|archive/ || file(f).content !~ /^\s*net.ipv6.conf.all.forwarding\s*=\s*1$/ } do
  		it { should be_empty }
  	end
  	files = command("find /run/sysctl.d -type f -regex .\\*/.\\*").stdout.split
  	describe files.delete_if { |f| command("file #{f} | cut -d: -f2").stdout =~ /binary|executable|archive/ || file(f).content !~ /^\s*net.ipv6.conf.all.forwarding\s*=\s*1$/ } do
  		it { should be_empty }
  	end
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_3.1.2_Ensure_packet_redirect_sending_is_disabled" do
  title "Ensure packet redirect sending is disabled"
  desc  "
    ICMP Redirects are used to send routing information to other hosts. As a host itself does not act as a router (in a host only configuration), there is no need to send redirects.
    
    Rationale: An attacker could use a compromised host to send invalid ICMP redirects to other router devices in an attempt to corrupt routing and have users access a system set up by the attacker as opposed to a valid system.
  "
  impact 1.0
  describe kernel_parameter("net.ipv4.conf.all.send_redirects") do
  	its("value") { should_not be_nil }
  end
  describe kernel_parameter("net.ipv4.conf.all.send_redirects") do
  	its("value") { should eq 0 }
  end
  describe.one do
  	describe file("/etc/sysctl.conf") do
  		its("content") { should match(/^\s*net.ipv4.conf.all.send_redirects\s*=\s*0$/) }
  	end
  	files = command("find /etc/sysctl.d -type f -regex .\\*/.\\*").stdout.split
  	describe files.delete_if { |f| command("file #{f} | cut -d: -f2").stdout =~ /binary|executable|archive/ || file(f).content !~ /^\s*net.ipv4.conf.all.send_redirects\s*=\s*0$/ } do
  		it { should_not be_empty }
  	end
  end
  describe kernel_parameter("net.ipv4.conf.default.send_redirects") do
  	its("value") { should_not be_nil }
  end
  describe kernel_parameter("net.ipv4.conf.default.send_redirects") do
  	its("value") { should eq 0 }
  end
  describe.one do
  	describe file("/etc/sysctl.conf") do
  		its("content") { should match(/^\s*net.ipv4.conf.default.send_redirects\s*=\s*0$/) }
  	end
  	files = command("find /etc/sysctl.d -type f -regex .\\*/.\\*").stdout.split
  	describe files.delete_if { |f| command("file #{f} | cut -d: -f2").stdout =~ /binary|executable|archive/ || file(f).content !~ /^\s*net.ipv4.conf.default.send_redirects\s*=\s*0$/ } do
  		it { should_not be_empty }
  	end
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_3.2.1_Ensure_source_routed_packets_are_not_accepted" do
  title "Ensure source routed packets are not accepted"
  desc  "
    In networking, source routing allows a sender to partially or fully specify the route packets take through a network. In contrast, non-source routed packets travel a path determined by routers in the network. In some cases, systems may not be routable or reachable from some locations (e.g. private addresses vs. Internet routable), and so source routed packets would need to be used.
    
    Rationale: Setting net.ipv4.conf.all.accept_source_route, net.ipv4.conf.default.accept_source_route, net.ipv6.conf.all.accept_source_route and net.ipv6.conf.default.accept_source_route to 0 disables the system from accepting source routed packets. Assume this system was capable of routing packets to Internet routable addresses on one interface and private addresses on another interface. Assume that the private addresses were not routable to the Internet routable addresses and vice versa. Under normal routing circumstances, an attacker from the Internet routable addresses could not use the system as a way to reach the private address systems. If, however, source routed packets were allowed, they could be used to gain access to the private address systems as the route could be specified, rather than rely on routing protocols that did not allow this routing.
  "
  impact 1.0
  describe kernel_parameter("net.ipv4.conf.all.accept_source_route") do
  	its("value") { should_not be_nil }
  end
  describe kernel_parameter("net.ipv4.conf.all.accept_source_route") do
  	its("value") { should eq 0 }
  end
  describe.one do
  	describe file("/etc/sysctl.conf") do
  		its("content") { should match(/^\s*net.ipv4.conf.all.accept_source_route\s*=\s*0$/) }
  	end
  	files = command("find /etc/sysctl.d -type f -regex .\\*/.\\*").stdout.split
  	describe files.delete_if { |f| command("file #{f} | cut -d: -f2").stdout =~ /binary|executable|archive/ || file(f).content !~ /^\s*net.ipv4.conf.all.accept_source_route\s*=\s*0$/ } do
  		it { should_not be_empty }
  	end
  end
  describe kernel_parameter("net.ipv4.conf.default.accept_source_route") do
  	its("value") { should_not be_nil }
  end
  describe kernel_parameter("net.ipv4.conf.default.accept_source_route") do
  	its("value") { should eq 0 }
  end
  describe.one do
  	describe file("/etc/sysctl.conf") do
  		its("content") { should match(/^\s*net.ipv4.conf.default.accept_source_route\s*=\s*0$/) }
  	end
  	files = command("find /etc/sysctl.d -type f -regex .\\*/.\\*").stdout.split
  	describe files.delete_if { |f| command("file #{f} | cut -d: -f2").stdout =~ /binary|executable|archive/ || file(f).content !~ /^\s*net.ipv4.conf.default.accept_source_route\s*=\s*0$/ } do
  		it { should_not be_empty }
  	end
  end
  describe kernel_parameter("net.ipv6.conf.all.accept_source_route") do
  	its("value") { should_not be_nil }
  end
  describe kernel_parameter("net.ipv6.conf.all.accept_source_route") do
  	its("value") { should eq 0 }
  end
  describe.one do
  	describe file("/etc/sysctl.conf") do
  		its("content") { should match(/^\s*net.ipv6.conf.all.accept_source_route\s*=\s*0$/) }
  	end
  	files = command("find /etc/sysctl.d -type f -regex .\\*/.\\*").stdout.split
  	describe files.delete_if { |f| command("file #{f} | cut -d: -f2").stdout =~ /binary|executable|archive/ || file(f).content !~ /^\s*net.ipv6.conf.all.accept_source_route\s*=\s*0$/ } do
  	end
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_3.2.2_Ensure_ICMP_redirects_are_not_accepted" do
  title "Ensure ICMP redirects are not accepted"
  desc  "
    ICMP redirect messages are packets that convey routing information and tell your host (acting as a router) to send packets via an alternate path. It is a way of allowing an outside routing device to update your system routing tables. By setting net.ipv4.conf.all.accept_redirects and net.ipv6.conf.all.accept_redirects to 0, the system will not accept any ICMP redirect messages, and therefore, won't allow outsiders to update the system's routing tables.
    
    Rationale: Attackers could use bogus ICMP redirect messages to maliciously alter the system routing tables and get them to send packets to incorrect networks and allow your system packets to be captured.
  "
  impact 1.0
  describe kernel_parameter("net.ipv4.conf.all.accept_redirects") do
  	its("value") { should_not be_nil }
  end
  describe kernel_parameter("net.ipv4.conf.all.accept_redirects") do
  	its("value") { should eq 0 }
  end
  describe.one do
  	describe file("/etc/sysctl.conf") do
  		its("content") { should match(/^\s*net.ipv4.conf.all.accept_redirects\s*=\s*0$/) }
  	end
  	files = command("find /etc/sysctl.d -type f -regex .\\*/.\\*").stdout.split
  	describe files.delete_if { |f| command("file #{f} | cut -d: -f2").stdout =~ /binary|executable|archive/ || file(f).content !~ /^\s*net.ipv4.conf.all.accept_redirects\s*=\s*0$/ } do
  		it { should_not be_empty }
  	end
  end
  describe kernel_parameter("net.ipv4.conf.all.accept_redirects") do
  	its("value") { should_not be_nil }
  end
  describe kernel_parameter("net.ipv4.conf.all.accept_redirects") do
  	its("value") { should eq 0 }
  end
  describe.one do
  	describe file("/etc/sysctl.conf") do
  		its("content") { should match(/^\s*net.ipv4.conf.all.accept_redirects\s*=\s*0$/) }
  	end
  	files = command("find /etc/sysctl.d -type f -regex .\\*/.\\*").stdout.split
  	describe files.delete_if { |f| command("file #{f} | cut -d: -f2").stdout =~ /binary|executable|archive/ || file(f).content !~ /^\s*net.ipv4.conf.all.accept_redirects\s*=\s*0$/ } do
  		it { should_not be_empty }
  	end
  end
  describe kernel_parameter("net.ipv6.conf.all.accept_redirects") do
  	its("value") { should_not be_nil }
  end
  describe kernel_parameter("net.ipv6.conf.all.accept_redirects") do
  	its("value") { should eq 0 }
  end
  describe.one do
  	describe file("/etc/sysctl.conf") do
  		its("content") { should match(/^\s*net.ipv6.conf.all.accept_redirects\s*=\s*0$/) }
  	end
  	files = command("find /etc/sysctl.d -type f -regex .\\*/.\\*").stdout.split
  	describe files.delete_if { |f| command("file #{f} | cut -d: -f2").stdout =~ /binary|executable|archive/ || file(f).content !~ /^\s*net.ipv6.conf.all.accept_redirects\s*=\s*0$/ } do
  		it { should_not be_empty }
  	end
  end
  describe kernel_parameter("net.ipv6.conf.default.accept_redirects") do
  	its("value") { should_not be_nil }
  end
  describe kernel_parameter("net.ipv6.conf.default.accept_redirects") do
  	its("value") { should eq 0 }
  end
  describe.one do
  	describe file("/etc/sysctl.conf") do
  		its("content") { should match(/^\s*net.ipv6.conf.default.accept_redirects\s*=\s*0$/) }
  	end
  	files = command("find /etc/sysctl.d -type f -regex .\\*/.\\*").stdout.split
  	describe files.delete_if { |f| command("file #{f} | cut -d: -f2").stdout =~ /binary|executable|archive/ || file(f).content !~ /^\s*net.ipv6.conf.default.accept_redirects\s*=\s*0$/ } do
  		it { should_not be_empty }
  	end
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_3.2.3_Ensure_secure_ICMP_redirects_are_not_accepted" do
  title "Ensure secure ICMP redirects are not accepted"
  desc  "
    Secure ICMP redirects are the same as ICMP redirects, except they come from gateways listed on the default gateway list. It is assumed that these gateways are known to your system, and that they are likely to be secure.
    
    Rationale: It is still possible for even known gateways to be compromised. Setting net.ipv4.conf.all.secure_redirects to 0 protects the system from routing table updates by possibly compromised known gateways.
  "
  impact 1.0
  describe kernel_parameter("net.ipv4.conf.all.secure_redirects") do
  	its("value") { should_not be_nil }
  end
  describe kernel_parameter("net.ipv4.conf.all.secure_redirects") do
  	its("value") { should eq 0 }
  end
  describe.one do
  	describe file("/etc/sysctl.conf") do
  		its("content") { should match(/^\s*net.ipv4.conf.all.secure_redirects\s*=\s*0$/) }
  	end
  	files = command("find /etc/sysctl.d -type f -regex .\\*/.\\*").stdout.split
  	describe files.delete_if { |f| command("file #{f} | cut -d: -f2").stdout =~ /binary|executable|archive/ || file(f).content !~ /^\s*net.ipv4.conf.all.secure_redirects\s*=\s*0$/ } do
  		it { should_not be_empty }
  	end
  end
  describe kernel_parameter("net.ipv4.conf.default.secure_redirects") do
  	its("value") { should_not be_nil }
  end
  describe kernel_parameter("net.ipv4.conf.default.secure_redirects") do
  	its("value") { should eq 0 }
  end
  describe.one do
  	describe file("/etc/sysctl.conf") do
  		its("content") { should match(/^\s*net.ipv4.conf.default.secure_redirects\s*=\s*0$/) }
  	end
  	files = command("find /etc/sysctl.d -type f -regex .\\*/.\\*").stdout.split
  	describe files.delete_if { |f| command("file #{f} | cut -d: -f2").stdout =~ /binary|executable|archive/ || file(f).content !~ /^\s*net.ipv4.conf.default.secure_redirects\s*=\s*0$/ } do
  		it { should_not be_empty }
  	end
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_3.2.4_Ensure_suspicious_packets_are_logged" do
  title "Ensure suspicious packets are logged"
  desc  "
    When enabled, this feature logs packets with un-routable source addresses to the kernel log.
    
    Rationale: Enabling this feature and logging these packets allows an administrator to investigate the possibility that an attacker is sending spoofed packets to their system.
  "
  impact 1.0
  describe kernel_parameter("net.ipv4.conf.all.log_martians") do
  	its("value") { should_not be_nil }
  end
  describe kernel_parameter("net.ipv4.conf.all.log_martians") do
  	its("value") { should eq 1 }
  end
  describe.one do
  	describe file("/etc/sysctl.conf") do
  		its("content") { should match(/^\s*net.ipv4.conf.all.log_martians\s*=\s*1$/) }
  	end
  	files = command("find /etc/sysctl.d -type f -regex .\\*/.\\*").stdout.split
  	describe files.delete_if { |f| command("file #{f} | cut -d: -f2").stdout =~ /binary|executable|archive/ || file(f).content !~ /^\s*net.ipv4.conf.all.log_martians\s*=\s*1$/ } do
  		it { should_not be_empty }
  	end
  end
  describe kernel_parameter("net.ipv4.conf.default.log_martians") do
  	its("value") { should_not be_nil }
  end
  describe kernel_parameter("net.ipv4.conf.default.log_martians") do
  	its("value") { should eq 1 }
  end
  describe.one do
  	describe file("/etc/sysctl.conf") do
  		its("content") { should match(/^\s*net.ipv4.conf.default.log_martians\s*=\s*1$/) }
  	end
  	files = command("find /etc/sysctl.d -type f -regex .\\*/.\\*").stdout.split
  	describe files.delete_if { |f| command("file #{f} | cut -d: -f2").stdout =~ /binary|executable|archive/ || file(f).content !~ /^\s*net.ipv4.conf.default.log_martians\s*=\s*1$/ } do
  		it { should_not be_empty }
  	end
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_3.2.5_Ensure_broadcast_ICMP_requests_are_ignored" do
  title "Ensure broadcast ICMP requests are ignored"
  desc  "
    Setting net.ipv4.icmp_echo_ignore_broadcasts to 1 will cause the system to ignore all ICMP echo and timestamp requests to broadcast and multicast addresses.
    
    Rationale: Accepting ICMP echo and timestamp requests with broadcast or multicast destinations for your network could be used to trick your host into starting (or participating) in a Smurf attack. A Smurf attack relies on an attacker sending large amounts of ICMP broadcast messages with a spoofed source address. All hosts receiving this message and responding would send echo-reply messages back to the spoofed address, which is probably not routable. If many hosts respond to the packets, the amount of traffic on the network could be significantly multiplied.
  "
  impact 1.0
  describe kernel_parameter("net.ipv4.icmp_echo_ignore_broadcasts") do
    its("value") { should eq 1 }
  end
  describe.one do
    describe file("/etc/sysctl.conf") do
      its("content") { should match(/^\s*net.ipv4.icmp_echo_ignore_broadcasts\s*=\s*1$/) }
    end
    files = command("find /etc/sysctl.d -type f -regex .\\*/.\\*").stdout.split
    describe files.delete_if { |f| command("file #{f} | cut -d: -f2").stdout =~ /binary|executable|archive/ || file(f).content !~ /^\s*net.ipv4.icmp_echo_ignore_broadcasts\s*=\s*1$/ } do
      it { should_not be_empty }
    end
    files = command("find /usr/lib/sysctl.d -type f -regex .\\*/.\\*").stdout.split
    describe files.delete_if { |f| command("file #{f} | cut -d: -f2").stdout =~ /binary|executable|archive/ || file(f).content !~ /^\s*net.ipv4.icmp_echo_ignore_broadcasts\s*=\s*1$/ } do
      it { should_not be_empty }
    end
    files = command("find /run/sysctl.d -type f -regex .\\*/.\\*").stdout.split
    describe files.delete_if { |f| command("file #{f} | cut -d: -f2").stdout =~ /binary|executable|archive/ || file(f).content !~ /^\s*net.ipv4.icmp_echo_ignore_broadcasts\s*=\s*1$/ } do
      it { should_not be_empty }
    end
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_3.2.6_Ensure_bogus_ICMP_responses_are_ignored" do
  title "Ensure bogus ICMP responses are ignored"
  desc  "
    Setting icmp_ignore_bogus_error_responses to 1 prevents the kernel from logging bogus responses (RFC-1122 non-compliant) from broadcast reframes, keeping file systems from filling up with useless log messages.
    
    Rationale: Some routers (and some attackers) will send responses that violate RFC-1122 and attempt to fill up a log file system with many useless error messages.
  "
  impact 1.0
  describe kernel_parameter("net.ipv4.icmp_ignore_bogus_error_responses") do
    its("value") { should eq 1 }
  end
  describe.one do
    describe file("/etc/sysctl.conf") do
      its("content") { should match(/^\s*net.ipv4.icmp_ignore_bogus_error_responses\s*=\s*1$/) }
    end
    files = command("find /etc/sysctl.d -type f -regex .\\*/.\\*").stdout.split
    describe files.delete_if { |f| command("file #{f} | cut -d: -f2").stdout =~ /binary|executable|archive/ || file(f).content !~ /^\s*net.ipv4.icmp_ignore_bogus_error_responses\s*=\s*1$/ } do
      it { should_not be_empty }
    end
    files = command("find /usr/lib/sysctl.d -type f -regex .\\*/.\\*").stdout.split
    describe files.delete_if { |f| command("file #{f} | cut -d: -f2").stdout =~ /binary|executable|archive/ || file(f).content !~ /^\s*net.ipv4.icmp_ignore_bogus_error_responses\s*=\s*1$/ } do
      it { should_not be_empty }
    end
    files = command("find /run/sysctl.d -type f -regex .\\*/.\\*").stdout.split
    describe files.delete_if { |f| command("file #{f} | cut -d: -f2").stdout =~ /binary|executable|archive/ || file(f).content !~ /^\s*net.ipv4.icmp_ignore_bogus_error_responses\s*=\s*1$/ } do
      it { should_not be_empty }
    end
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_3.2.7_Ensure_Reverse_Path_Filtering_is_enabled" do
  title "Ensure Reverse Path Filtering is enabled"
  desc  "
    Setting net.ipv4.conf.all.rp_filter and net.ipv4.conf.default.rp_filter to 1 forces the Linux kernel to utilize reverse path filtering on a received packet to determine if the packet was valid. Essentially, with reverse path filtering, if the return packet does not go out the same interface that the corresponding source packet came from, the packet is dropped (and logged if log_martians is set).
    
    Rationale: Setting these flags is a good way to deter attackers from sending your system bogus packets that cannot be responded to. One instance where this feature breaks down is if asymmetrical routing is employed. This would occur when using dynamic routing protocols (bgp, ospf, etc) on your system. If you are using asymmetrical routing on your system, you will not be able to enable this feature without breaking the routing.
  "
  impact 1.0
  describe kernel_parameter("net.ipv4.conf.all.rp_filter") do
    its("value") { should eq 1 }
  end
  describe.one do
    describe file("/etc/sysctl.conf") do
      its("content") { should match(/^\s*net.ipv4.conf.all.rp_filter\s*=\s*1$/) }
    end
    files = command("find /etc/sysctl.d -type f -regex .\\*/.\\*").stdout.split
    describe files.delete_if { |f| command("file #{f} | cut -d: -f2").stdout =~ /binary|executable|archive/ || file(f).content !~ /^\s*net.ipv4.conf.all.rp_filter\s*=\s*1$/ } do
      it { should_not be_empty }
    end
    files = command("find /usr/lib/sysctl.d -type f -regex .\\*/.\\*").stdout.split
    describe files.delete_if { |f| command("file #{f} | cut -d: -f2").stdout =~ /binary|executable|archive/ || file(f).content !~ /^\s*net.ipv4.conf.all.rp_filter\s*=\s*1$/ } do
      it { should_not be_empty }
    end
    files = command("find /run/sysctl.d -type f -regex .\\*/.\\*").stdout.split
    describe files.delete_if { |f| command("file #{f} | cut -d: -f2").stdout =~ /binary|executable|archive/ || file(f).content !~ /^\s*net.ipv4.conf.all.rp_filter\s*=\s*1$/ } do
      it { should_not be_empty }
    end
  end
  describe kernel_parameter("net.ipv4.conf.default.rp_filter") do
    its("value") { should_not be_nil }
    its("value") { should eq 1 }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_3.2.8_Ensure_TCP_SYN_Cookies_is_enabled" do
  title "Ensure TCP SYN Cookies is enabled"
  desc  "
    When tcp_syncookies is set, the kernel will handle TCP SYN packets normally until the half-open connection queue is full, at which time, the SYN cookie functionality kicks in. SYN cookies work by not using the SYN queue at all. Instead, the kernel simply replies to the SYN with a SYN|ACK, but will include a specially crafted TCP sequence number that encodes the source and destination IP address and port number and the time the packet was sent. A legitimate connection would send the ACK packet of the three way handshake with the specially crafted sequence number. This allows the system to verify that it has received a valid response to a SYN cookie and allow the connection, even though there is no corresponding SYN in the queue.
    
    Rationale: Attackers use SYN flood attacks to perform a denial of service attacked on a system by sending many SYN packets without completing the three way handshake. This will quickly use up slots in the kernel's half-open connection queue and prevent legitimate connections from succeeding. SYN cookies allow the system to keep accepting valid connections, even if under a denial of service attack.
  "
  impact 1.0
  describe kernel_parameter("net.ipv4.tcp_syncookies") do
    its("value") { should eq 1 }
  end
  describe.one do
    describe file("/etc/sysctl.conf") do
      its("content") { should match(/^\s*net.ipv4.tcp_syncookies\s*=\s*1$/) }
    end
    files = command("find /etc/sysctl.d -type f -regex .\\*/.\\*").stdout.split
    describe files.delete_if { |f| command("file #{f} | cut -d: -f2").stdout =~ /binary|executable|archive/ || file(f).content !~ /^\s*net.ipv4.tcp_syncookies\s*=\s*1$/ } do
      it { should_not be_empty }
    end
    files = command("find /usr/lib/sysctl.d -type f -regex .\\*/.\\*").stdout.split
    describe files.delete_if { |f| command("file #{f} | cut -d: -f2").stdout =~ /binary|executable|archive/ || file(f).content !~ /^\s*net.ipv4.tcp_syncookies\s*=\s*1$/ } do
      it { should_not be_empty }
    end
    files = command("find /run/sysctl.d -type f -regex .\\*/.\\*").stdout.split
    describe files.delete_if { |f| command("file #{f} | cut -d: -f2").stdout =~ /binary|executable|archive/ || file(f).content !~ /^\s*net.ipv4.tcp_syncookies\s*=\s*1$/ } do
      it { should_not be_empty }
    end
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_3.2.9_Ensure_IPv6_router_advertisements_are_not_accepted" do
  title "Ensure IPv6 router advertisements are not accepted"
  desc  "
    This setting disables the system's ability to accept IPv6 router advertisements.
    
    Rationale: It is recommended that systems do not accept router advertisements as they could be tricked into routing traffic to compromised machines. Setting hard routes within the system (usually a single default route to a trusted router) protects the system from bad routes.
  "
  impact 1.0
  if command("grep '^\\s*kernelopts=\\(\\S\\+\\s\\+\\)*ipv6.disable=1\\b\\s*\\(\\S\\+\\s*\\)*$' /boot/grub2/grubenv").exit_status == 1
    describe kernel_parameter('net.ipv6.conf.all.accept_ra') do
      its('value') { should eq 0 }
    end
    describe kernel_parameter('net.ipv6.conf.default.accept_ra') do
      its('value') { should eq 0 }
    end
    describe.one do
      describe file('/etc/sysctl.conf') do
        its('content') { should match(/^\s*net.ipv6.conf.all.accept_ra\s*=\s*0$/) }
      end
      files = command("find /etc/sysctl.d -type f -regex .\\*/.\\*").stdout.split
      describe files.delete_if { |f| command("file #{f} | cut -d: -f2").stdout =~ /binary|executable|archive/ || file(f).content !~ /^\s*net.ipv6.conf.all.accept_ra\s*=\s*0$/ } do
        it { should_not be_empty }
      end
    end
    describe.one do
      describe file('/etc/sysctl.conf') do
        its('content') { should match(/^\s*net.ipv6.conf.default.accept_ra\s*=\s*0$/) }
      end
      files = command("find /etc/sysctl.d -type f -regex .\\*/.\\*").stdout.split
      describe files.delete_if { |f| command("file #{f} | cut -d: -f2").stdout =~ /binary|executable|archive/ || file(f).content !~ /^\s*net.ipv6.conf.default.accept_ra\s*=\s*0$/ } do
        it { should_not be_empty }
      end
    end
  else
    describe command ("grep '^\\s*kernelopts=\\(\\S\\+\\s\\+\\)*ipv6.disable=1\\b\\s*\\(\\S\\+\\s*\\)*$' /boot/grub2/grubenv") do
      its('exit_status') { should_not eq 1 }
    end
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_3.4.1.1_Ensure_a_Firewall_package_is_installed" do
  title "Ensure a Firewall package is installed"
  desc  "
    A Firewall package should be selected.  Most firewall configuration utilities operate as a front end to nftables or iptables.
    
    Rationale: A Firewall package  is required for firewall management and configuration.
  "
  impact 1.0
  describe.one do
    describe package("iptables") do
      it { should be_installed }
    end
    describe package("iptables-services") do
      it { should be_installed }
    end
    describe package("firewalld") do
      it { should be_installed }
    end
    describe package("nftables") do
      it { should be_installed }
    end
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_3.4.2.1_Ensure_firewalld_service_is_enabled_and_running" do
  title "Ensure firewalld service is enabled and running"
  desc  "
    Ensure that the firewalld service is enabled to protect your system
    
    Rationale: firewalld (Dynamic Firewall Manager) tool provides a dynamically managed firewall. The tool enables network/firewall zones to define the trust level of network connections and/or interfaces. It has support both for IPv4 and IPv6 firewall settings. Also, it supports Ethernet bridges and allow you to separate between runtime and permanent configuration options. Finally, it supports an interface for services or applications to add firewall rules directly
  "
  impact 1.0
  describe.one do
    describe service("firewalld") do
      it { should be_enabled }
    end
    describe service("iptables") do
      it { should be_enabled }
    end
    describe service("nftables") do
      it { should be_enabled }
    end
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_3.4.2.2_Ensure_iptables_service_is_not_enabled_with_firewalld" do
  title "Ensure iptables service is not enabled with firewalld"
  desc  "
    IPtables is an application that allows a system administrator to configure the IPv4 and IPv6 tables, chains and rules provided by the Linux kernel firewall.
    
    IPtables is installed as a dependency with firewalld.
    
    Rationale: Running firewalld and IPtables concurrently may lead to conflict, therefore IPtables should be stopped and masked when using firewalld.
  "
  impact 1.0
  if package('firewalld').installed? && service('firewalld').enabled?
     describe.one do
       describe package('iptables') do
         it { should_not be_installed }
       end
       describe service('iptables') do
         it { should_not be_enabled }
       end
     end
   else
     describe.one do
       describe package('firewalld') do
         it { should_not be_installed }
       end
       describe service('firewalld') do
         it { should_not be_enabled }
       end
     end
   end
end

control "xccdf_org.cisecurity.benchmarks_rule_3.4.2.3_Ensure_nftables_is_not_enabled_with_firewalld" do
  title "Ensure nftables is not enabled with firewalld"
  desc  "
    nftables is a subsystem of the Linux kernel providing filtering and classification of network packets/datagrams/frames and is the successor to iptables.
    
    nftables are installed as a dependency with firewalld.
    
    Rationale: Running firewalld and nftables concurrently may lead to conflict, therefore nftables should be stopped and masked when using firewalld.
  "
  impact 1.0
  if package('firewalld').installed? && service('firewalld').enabled?
    describe.one do
      describe package('nftables') do
        it { should_not be_installed }
      end
      describe service('nftables') do
        it { should_not be_enabled }
      end
    end
  else
    describe.one do
      describe package('firewalld') do
        it { should_not be_installed }
      end
      describe service('firewalld') do
        it { should_not be_enabled }
      end
    end
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_3.4.2.4_Ensure_firewalld_default_zone_is_set" do
  title "Ensure firewalld default zone is set"
  desc  "
    A firewall zone defines the trust level for a connection, interface or source address binding. This is a one to many relation, which means that a connection, interface or source can only be part of one zone, but a zone can be used for many network connections, interfaces and sources.
    
    The default zone is the zone that is used for everything that is not explicitely bound/assigned to another zone.
    
    That means that if there is no zone assigned to a connection, interface or source, only the default zone is used. The default zone is not always listed as being used for an interface or source as it will be used for it either way. This depends on the manager of the interfaces.
    
    Connections handled by NetworkManager are listed as NetworkManager requests to add the zone binding for the interface used by the connection. Also interfaces under control of the network service are listed also because the service requests it.
    
    Rationale: Because the default zone is the zone that is used for everything that is not explicitly bound/assigned to another zone, it is important for the default zone to set
  "
  impact 1.0
  describe.one do
    describe file("/etc/firewalld/firewalld.conf") do
      its("content") { should match(/^\s*DefaultZone=\S+/) }
    end
    describe package("firewalld") do
      it { should_not be_installed }
    end
    describe service("firewalld") do
      it { should_not be_enabled }
    end
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_3.4.2.5_Ensure_network_interfaces_are_assigned_to_appropriate_zone" do
  title "Ensure network interfaces are assigned to appropriate zone"
  desc  "
    firewall zones define the trust level of network connections or interfaces.
    
    Rationale: A network interface not assigned to the appropriate zone can allow unexpected or undesired network traffic to be accepted on the interface
  "
  impact 0.0
  describe "No tests defined for this control" do
    skip "No tests defined for this control"
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_3.4.2.6_Ensure_firewalld_drops_unnecessary_services_and_ports" do
  title "Ensure firewalld drops unnecessary services and ports"
  desc  "
    Services and ports can be accepted or explicitly rejected or dropped by a zone.
    
    For every zone, you can set a default behavior that handles incoming traffic that is not further specified. Such behavior is defined by setting the target of the zone. There are three options - default, ACCEPT, REJECT, and DROP.
    
    By setting the target to ACCEPT, you accept all incoming packets except those disabled by a specific rule.
    
    If you set the target to REJECT or DROP, you disable all incoming packets except those that you have allowed in specific rules. When packets are rejected, the source machine is informed about the rejection, while there is no information sent when the packets are dropped.
    
    Rationale: To reduce the attack surface of a system, all services and ports should be blocked unless required
  "
  impact 0.0
  describe "No tests defined for this control" do
    skip "No tests defined for this control"
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_3.4.3.1_Ensure_iptables_are_flushed_with_nftables" do
  title "Ensure iptables are flushed with nftables"
  desc  "
    nftables is a replacement for iptables, ip6tables, ebtables and arptables
    
    Rationale: It is possible to mix iptables and nftables. However, this increases complexity and also the chance to introduce errors. For simplicity flush out all iptables rules, and ensure it is not loaded
  "
  impact 0.0
  if package('nftables').installed? && service('nftables').enabled? && package('iptables').installed?
    describe command('iptables -L --line-numbers') do
      its('stdout') { should_not match(/^\s*\d/) }
      its('exit_status') { should eq 0 }
    end
    describe command('ip6tables -L --line-numbers') do
      its('stdout') { should_not match(/^\s*\d/) }
      its('exit_status') { should eq 0 }
    end
  else
    describe.one do
      describe package('nftables') do
        it { should_not be_installed }
      end
      describe service('nftables') do
        it { should_not be_enabled }
      end
      describe package('iptables') do
        it { should_not be_installed }
      end
    end
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_3.4.3.2_Ensure_an_nftables_table_exists" do
  title "Ensure an nftables table exists"
  desc  "
    Tables hold chains.  Each table only has one address family and only applies to packets of this family.  Tables can have one of five families.
    
    Rationale: nftables doesn't have any default tables.  Without a table being build, nftables will not filter network traffic.
  "
  impact 1.0
  describe.one do
    describe command('nft list tables') do
      its('stdout') { should match(/^table\s+\S+\s+\S+/) }
      its('exit_status') { should eq 0 }
    end
    describe package('nftables') do
      it { should_not be_installed }
    end
    describe service('nftables') do
      it { should_not be_enabled }
    end
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_3.4.3.3_Ensure_nftables_base_chains_exist" do
  title "Ensure nftables base chains exist"
  desc  "
    Chains are containers for rules. They exist in two kinds, base chains and regular chains. A base chain is an  entry  point  for packets from the networking stack, a regular chain may be used as jump target and is used for better rule organization.
    
    Rationale: If a base chain doesn't exist with a hook for input, forward, and delete, packets that would flow through those chains will not be touched by nftables.
  "
  impact 1.0
  if package('nftables').installed? && service('nftables').enabled?
    describe command('nft list ruleset') do
      its('stdout') { should match(/^\s*\S+\s+\S+\s+hook\s+input/) }
      its('stdout') { should match(/^\s*\S+\s+\S+\s+hook\s+forward/) }
      its('stdout') { should match(/^\s*\S+\s+\S+\s+hook\s+output/) }
      its('exit_status') { should eq 0 }
    end
  else
    describe.one do
      describe package('nftables') do
        it { should_not be_installed }
      end
      describe service('nftables') do
        it { should_not be_enabled }
      end
    end
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_3.4.3.4_Ensure_nftables_loopback_traffic_is_configured" do
  title "Ensure nftables loopback traffic is configured"
  desc  "
    Configure the loopback interface to accept traffic. Configure all other interfaces to deny traffic to the loopback network
    
    Rationale: Loopback traffic is generated between processes on a machine and is typically critical to operation of the system. The loopback interface is the only place that loopback network traffic should be seen, all other interfaces should ignore traffic on this network as an anti-spoofing measure.
  "
  impact 1.0
  if package('nftables').installed? && service('nftables').enabled?
    describe.one do
      describe command("nft list ruleset | awk '/hook input/,/}/' | grep 'iif \"lo\" accept'") do
        its('stdout') { should match(/^\s*iif\s+"lo"\s+accept/) }
        its('exit_status') { should eq 0 }
      end
      describe command("nft list ruleset | awk '/hook input/,/}/' | grep 'ip sddr'") do
        its('stdout') { should match(/^\s*ip\s+saddr\s+127\.0\.0\.0\/8\s+counter\s+packets\s+0\s+bytes\s+0\s+drop/) }
        its('exit_status') { should eq 0 }
      end
    end
    describe.one do
      describe command("nft list ruleset | awk '/hook input/,/}/' | grep 'ip6 saddr'") do
        its('stdout') { should match(/^\s*ip6\s+saddr\s+\:\:1\s+counter\s+packets\s+0\s+bytes\s+0\s+drop/) }
        its('exit_status') { should eq 0 }
      end
      describe file("\\boot\\grub2\\grubenv") do
        its("content") { should match(/^\s*kernelopts=(\S+\s+)*ipv6\.disable=1\s*(\S+\s*)*$/) }
      end
    end
  else
    describe.one do
      describe package('nftables') do
        it { should_not be_installed }
      end
      describe service('nftables') do
        it { should_not be_enabled }
      end
    end
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_3.4.3.5_Ensure_nftables_outbound_and_established_connections_are_configured" do
  title "Ensure nftables outbound and established connections are configured"
  desc  "
    Configure the firewall rules for new outbound, and established connections
    
    Rationale: If rules are not in place for new outbound, and established connections all packets will be dropped by the default policy preventing network usage.
  "
  impact 0.0
  describe "No tests defined for this control" do
    skip "No tests defined for this control"
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_3.4.3.6_Ensure_nftables_default_deny_firewall_policy" do
  title "Ensure nftables default deny firewall policy"
  desc  "
    Base chain policy is the default verdict that will be applied to packets reaching the end of the chain.
    
    Rationale: There are two policies: accept (Default) and drop.  If the policy is set to accept , the firewall will accept any packet that is not configured to be denied and the packet will continue transversing the network stack.
    
    It is easier to white list acceptable usage than to black list unacceptable usage.
  "
  impact 1.0
  if package('nftables').installed? && service('nftables').enabled?
    describe command("nft list ruleset | grep 'hook input'") do
      its('stdout') { should match(/^.*policy\s*drop;$/) }
      its('exit_status') { should eq 0 }
    end
    describe command("nft list ruleset | grep 'hook forward'") do
      its('stdout') { should match(/^.*policy\s*drop;$/) }
      its('exit_status') { should eq 0 }
    end
    describe command("nft list ruleset | grep 'hook output'") do
      its('stdout') { should match(/^.*policy\s*drop;$/) }
      its('exit_status') { should eq 0 }
    end
  else
    describe.one do
      describe package('nftables') do
        it { should_not be_installed }
      end
      describe service('nftables') do
        it { should_not be_enabled }
      end
    end
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_3.4.3.7_Ensure_nftables_service_is_enabled" do
  title "Ensure nftables service is enabled"
  desc  "
    The nftables service allows for the loading of nftables rulesets during boot, or starting of the nftables service
    
    Rationale: The nftables service restores the nftables rules from the rules files referenced in the /etc/sysconfig/nftables.conf file durring boot or the starting of the nftables service
  "
  impact 1.0
  describe.one do
    describe service("nftables") do
      it { should be_enabled }
    end
    describe service("firewalld") do
      it { should be_enabled }
    end
    describe service("iptables") do
      it { should be_enabled }
    end
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_3.4.3.8_Ensure_nftables_rules_are_permanent" do
  title "Ensure nftables rules are permanent"
  desc  "
    nftables is a subsystem of the Linux kernel providing filtering and classification of network packets/datagrams/frames.
    
    The nftables service reads the /etc/sysconfig/nftables.conf file for a nftables file or files to include in the nftables ruleset.
    
    A nftables ruleset containing the input, forward, and output base chains allow network traffic to be filtered.
    
    Rationale: Changes made to nftables ruleset only affect the live system, you will also need to configure the nftables ruleset to apply on boot.
  "
  impact 1.0
  if package('nftables').installed? && service('nftables').enabled?
    describe file("/etc/sysconfig/nftables.conf") do
      its("content") { should match(/^\s*include/) }
    end
  else
    describe.one do
      describe package("nftables") do
        it { should_not be_installed }
      end
      describe service("nftables") do
        it { should_not be_enabled }
      end
    end
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_3.4.4.1.1_Ensure_iptables_default_deny_firewall_policy" do
  title "Ensure iptables default deny firewall policy"
  desc  "
    A default deny all policy on connections ensures that any unconfigured network usage will be rejected.
    
    Rationale: With a default accept policy the firewall will accept any packet that is not configured to be denied. It is easier to white list acceptable usage than to black list unacceptable usage.
  "
  impact 1.0
  if package('iptables').installed? && service('iptables').enabled?
    %w[INPUT OUTPUT FORWARD].each do |chain|
      describe.one do
        describe iptables do
          it { should have_rule("-P #{chain} DROP") }
        end
        describe iptables do
          it { should have_rule("-P #{chain} REJECT") }
        end
      end
    end
  else
    describe.one do
      describe package('iptables') do
        it { should_not be_installed }
      end
      describe service('iptables') do
        it { should_not be_enabled }
      end
    end
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_3.4.4.1.2_Ensure_iptables_loopback_traffic_is_configured" do
  title "Ensure iptables loopback traffic is configured"
  desc  "
    Configure the loopback interface to accept traffic. Configure all other interfaces to deny traffic to the loopback network (127.0.0.0/8).
    
    Rationale: Loopback traffic is generated between processes on machine and is typically critical to operation of the system. The loopback interface is the only place that loopback network (127.0.0.0/8) traffic should be seen, all other interfaces should ignore traffic on this network as an anti-spoofing measure.
  "
  impact 1.0
  describe.one do
    describe iptables do
      it { should have_rule('-A INPUT -i lo -j ACCEPT') }
      it { should have_rule('-A OUTPUT -o lo -j ACCEPT') }
      it { should have_rule('-A INPUT -s 127.0.0.0/8 -j DROP') }
    end
    describe package('iptables') do
      it { should_not be_installed }
    end
    describe service('iptables') do
      it { should_not be_enabled }
    end
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_3.4.4.1.3_Ensure_iptables_outbound_and_established_connections_are_configured" do
  title "Ensure iptables outbound and established connections are configured"
  desc  "
    Configure the firewall rules for new outbound, and established connections.
    
    Rationale: If rules are not in place for new outbound, and established connections all packets will be dropped by the default policy preventing network usage.
  "
  impact 0.0
  describe iptables do
    it { should have_rule('-P INPUT ACCEPT') }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_3.4.4.1.4_Ensure_iptables_firewall_rules_exist_for_all_open_ports" do
  title "Ensure iptables firewall rules exist for all open ports"
  desc  "
    Any ports that have been opened on non-loopback addresses need firewall rules to govern traffic.
    
    Rationale: Without a firewall rule configured for open ports default firewall policy will drop all packets to these ports.
  "
  impact 1.0
  if package('iptables').installed? && service('iptables').enabled?
    port.where { protocol =~ /.*/ && port >= 0 && address =~ /^(?!127\.0\.0\.1|::1|::).*$/ }.entries.each do |entry|
      rule_inbound = "-A INPUT -p #{entry[:protocol]} -m #{entry[:protocol]} --dport #{entry[:port]} -m state --state NEW,ESTABLISHED -j ACCEPT"
      rule_outbound = "-A OUTPUT -p #{entry[:protocol]} -m #{entry[:protocol]} --sport #{entry[:port]} -m state --state ESTABLISHED -j ACCEPT"
      describe iptables do
        it { should have_rule(rule_inbound) }
        it { should have_rule(rule_outbound) }
      end
    end
  else
    describe.one do
      describe package('iptables') do
        it { should_not be_installed }
      end
      describe service('iptables') do
        it { should_not be_enabled }
      end
    end
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_3.4.4.1.5_Ensure_iptables_is_enabled_and_active" do
  title "Ensure iptables is enabled and active"
  desc  "
    iptables.service is a utility for configuring and maintaining iptables .
    
    Rationale: iptables.service will load the iptables rules saved in the file /etc/sysconfig/iptables at boot, otherwise the iptables rules will be cleared during a re-boot of the system.
  "
  impact 1.0
  describe.one do
    describe service("iptables") do
      it { should be_enabled }
    end
    describe service("iptables").params do
      its("ActiveState") { should eq "active" }
    end
    describe service("nftables") do
      it { should be_enabled }
    end
    describe service("firewalld") do
      it { should be_enabled }
    end
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_3.4.4.2.1_Ensure_ip6tables_default_deny_firewall_policy" do
  title "Ensure ip6tables default deny firewall policy"
  desc  "
    A default deny all policy on connections ensures that any unconfigured network usage will be rejected.
    
    Rationale: With a default accept policy the firewall will accept any packet that is not configured to be denied. It is easier to white list acceptable usage than to black list unacceptable usage.
  "
  impact 1.0
  if package('iptables').installed? && service('iptables').enabled?
    %w[INPUT OUTPUT FORWARD].each do |chain|
      describe.one do
        describe ip6tables do
          it { should have_rule("-P #{chain} DROP") }
        end
        describe ip6tables do
          it { should have_rule("-P #{chain} REJECT") }
        end
      end
    end
  else
    describe.one do
      describe package('iptables') do
        it { should_not be_installed }
      end
      describe service('iptables') do
        it { should_not be_enabled }
      end
      describe file("/boot/grub2/grubenv") do
        its("content") { should match(/^\s*kernelopts=(\S+\s+)*ipv6\.disable=1\b\s*(\S+\s*)*$/) }
      end
    end
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_3.4.4.2.2_Ensure_ip6tables_loopback_traffic_is_configured" do
  title "Ensure ip6tables loopback traffic is configured"
  desc  "
    Configure the loopback interface to accept traffic. Configure all other interfaces to deny traffic to the loopback network (::1).
    
    Rationale: Loopback traffic is generated between processes on machine and is typically critical to operation of the system. The loopback interface is the only place that loopback network (::1) traffic should be seen, all other interfaces should ignore traffic on this network as an anti-spoofing measure.
  "
  impact 1.0
  describe.one do
    describe ip6tables do
      it { should have_rule('-A INPUT -i lo -j ACCEPT') }
      it { should have_rule('-A OUTPUT -o lo -j ACCEPT') }
      it { should have_rule('-A INPUT -s ::1 -j DROP') }
    end
    describe package('iptables') do
      it { should_not be_installed }
    end
    describe service('iptables') do
      it { should_not be_enabled }
    end
    describe file("/boot/grub2/grubenv") do
      its("content") { should match(/^\s*kernelopts=(\S+\s+)*ipv6\.disable=1\b\s*(\S+\s*)*$/) }
    end
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_3.4.4.2.3_Ensure_ip6tables_outbound_and_established_connections_are_configured" do
  title "Ensure ip6tables outbound and established connections are configured"
  desc  "
    Configure the firewall rules for new outbound, and established IPv6 connections.
    
    Rationale: If rules are not in place for new outbound, and established connections all packets will be dropped by the default policy preventing network usage.
  "
  impact 0.0
  describe iptables do
    it { should have_rule('-P INPUT ACCEPT') }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_3.4.4.2.4_Ensure_ip6tables_firewall_rules_exist_for_all_open_ports" do
  title "Ensure ip6tables firewall rules exist for all open ports"
  desc  "
    Any ports that have been opened on non-loopback addresses need firewall rules to govern traffic.
    
    Rationale: Without a firewall rule configured for open ports default firewall policy will drop all packets to these ports.
  "
  impact 1.0
  port.where { address !~ /^(127\.0\.0\.1|::1)$/ }.ports.each do |port|
    describe "Firewall rule should exist for port #{port}" do
      subject { ip6tables.retrieve_rules.any? { |s| s =~ /\s--(dport|dports) #{port}\s/ } }
      it { should be true }
    end
  end
  
  describe port.where { protocol =~ /tcp/ && port > 22 && port < 80 } do
    it { should_not be_listening }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_3.4.4.2.5_Ensure_ip6tables_is_enabled_and_active" do
  title "Ensure ip6tables is enabled and active"
  desc  "
    ip6tables.service is a utility for configuring and maintaining ip6tables .
    
    Rationale: ip6tables.service will load the iptables rules saved in the file /etc/sysconfig/ip6tables at boot, otherwise the ip6tables rules will be cleared during a re-boot of the system.
  "
  impact 1.0
  describe.one do
    describe service("ip6tables") do
      it { should be_enabled }
    end
    describe service("ip6tables").params do
      its("ActiveState") { should eq "active" }
    end
    describe command('/sbin/sysctl net.ipv6.conf.all.disable_ipv6') do
      its(:stdout) { should match /net.ipv6.conf.all.disable_ipv6 = 0/ }
    end
    describe service("firewalld") do
      it { should be_enabled }
    end
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_3.5_Ensure_wireless_interfaces_are_disabled" do
  title "Ensure wireless interfaces are disabled"
  desc  "
    Wireless networking is used when wired networks are unavailable. CentOS Linux contains a wireless tool kit to allow system administrators to configure and use wireless networks.
    
    Rationale: If wireless is not to be used, wireless devices can be disabled to reduce the potential attack surface.
  "
  impact 1.0
  describe command('nmcli radio wifi') do
    its('stdout') { should_not match(/enabled/) }
    its('exit_status') { should eq 0 }
  end
  describe command('nmcli radio wwan') do
    its('stdout') { should_not match(/enabled/) }
    its('exit_status') { should eq 0 }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_4.2.1.1_Ensure_rsyslog_is_installed" do
  title "Ensure rsyslog is installed"
  desc  "
    The rsyslog software is a recommended replacement to the original syslogd daemon which provide improvements over syslogd , such as connection-oriented (i.e. TCP) transmission of logs, the option to log to database formats, and the encryption of log data en route to a central logging server.
    
    Rationale: The security enhancements of rsyslog such as connection-oriented (i.e. TCP) transmission of logs, the option to log to database formats, and the encryption of log data en route to a central logging server) justify installing and configuring the package.
  "
  impact 1.0
  describe package("rsyslog") do
    it { should be_installed }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_4.2.1.2_Ensure_rsyslog_Service_is_enabled" do
  title "Ensure rsyslog Service is enabled"
  desc  "
    Once the rsyslog package is installed it needs to be activated.
    
    Rationale: If the rsyslog service is not activated the system may default to the syslogd service or lack logging instead.
  "
  impact 1.0
  describe service("rsyslog") do
    it { should be_enabled }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_4.2.1.3_Ensure_rsyslog_default_file_permissions_configured" do
  title "Ensure rsyslog default file permissions configured"
  desc  "
    rsyslog will create logfiles that do not already exist on the system. This setting controls what permissions will be applied to these newly created files.
    
    Rationale: It is important to ensure that log files have the correct permissions to ensure that sensitive data is archived and protected.
  "
  impact 1.0
  describe.one do
    describe file("/etc/rsyslog.conf") do
      its("content") { should match(/^\s*\$FileCreateMode\s+0[6420][40]0\s*(\s+#.*)?$/) }
    end
    files = command("find /etc/rsyslog.d/ -type f -regex .\\*/.\\*\\\\.conf").stdout.split
    describe files.delete_if { |f| command("file #{f} | cut -d: -f2").stdout =~ /binary|executable|archive/ || file(f).content !~ /^\s*\$FileCreateMode\s+0[6420][40]0\s*(\s+#.*)?$/ } do
      it { should_not be_empty }
    end
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_4.2.1.4_Ensure_logging_is_configured" do
  title "Ensure logging is configured"
  desc  "
    The /etc/rsyslog.conf and /etc/rsyslog.d/*.conf files specifies rules for logging and which files are to be used to log certain classes of messages.
    
    Rationale: A great deal of important security-related information is sent via rsyslog (e.g., successful and failed su attempts, failed login attempts, root login attempts, etc.).
  "
  impact 0.0
  describe "No tests defined for this control" do
    skip "No tests defined for this control"
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_4.2.1.5_Ensure_rsyslog_is_configured_to_send_logs_to_a_remote_log_host" do
  title "Ensure rsyslog is configured to send logs to a remote log host"
  desc  "
    The rsyslog utility supports the ability to send logs it gathers to a remote log host running syslogd(8) or to receive messages from remote hosts, reducing administrative overhead.
    
    Rationale: Storing log data on a remote host protects log integrity from local attacks. If an attacker gains root access on the local system, they could tamper with or remove log data that is stored on the local system
  "
  impact 1.0
  describe.one do
    describe file("/etc/rsyslog.conf") do
      its("content") { should match(/^\s*\*\.\*\s+@/) }
    end
    files = command("find /etc/rsyslog.d/ -type f -regex .\\*/.\\*\\\\.conf").stdout.split
    describe files.delete_if { |f| command("file #{f} | cut -d: -f2").stdout =~ /binary|executable|archive/ || file(f).content !~ /^\s*\*\.\*\s+@/ } do
      it { should_not be_empty }
    end
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_4.2.1.6_Ensure_remote_rsyslog_messages_are_only_accepted_on_designated_log_hosts." do
  title "Ensure remote rsyslog messages are only accepted on designated log hosts."
  desc  "
    By default, rsyslog does not listen for log messages coming in from remote systems. The ModLoad tells rsyslog to load the imtcp.so module so it can listen over a network via TCP. The InputTCPServerRun option instructs rsyslogd to listen on the specified TCP port.
    
    Rationale: The guidance in the section ensures that remote log hosts are configured to only accept rsyslog data from hosts within the specified domain and that those systems that are not designed to be log hosts do not accept any remote rsyslog messages. This provides protection from spoofed log data and ensures that system administrators are reviewing reasonably complete syslog data in a central location.
  "
  impact 0.0
  describe "No tests defined for this control" do
    skip "No tests defined for this control"
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_4.2.2.1_Ensure_journald_is_configured_to_send_logs_to_rsyslog" do
  title "Ensure journald is configured to send logs to rsyslog"
  desc  "
    Data from journald may be stored in volatile memory or persisted locally on the server.  Utilities exist to accept remote export of journald logs, however, use of the rsyslog service provides a consistent means of log collection and export.
    
    Rationale: Storing log data on a remote host protects log integrity from local attacks. If an attacker gains root access on the local system, they could tamper with or remove log data that is stored on the local system.
  "
  impact 1.0
  describe file("/etc/systemd/journald.conf") do
    its("content") { should match(/^\s*(?i)ForwardToSyslog\s*=\s*yes(\s+#.*)*$/) }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_4.2.2.2_Ensure_journald_is_configured_to_compress_large_log_files" do
  title "Ensure journald is configured to compress large log files"
  desc  "
    The journald system includes the capability of compressing overly large files to avoid filling up the system with logs or making the logs unmanageably large.
    
    Rationale: Uncompressed large files may unexpectedly fill a filesystem leading to resource unavailability.  Compressing logs prior to write can prevent sudden, unexpected filesystem impacts.
  "
  impact 1.0
  describe file("/etc/systemd/journald.conf") do
    its("content") { should match(/^\s*(?i)Compress\s*=\s*yes(\s+#.*)*$/) }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_4.2.2.3_Ensure_journald_is_configured_to_write_logfiles_to_persistent_disk" do
  title "Ensure journald is configured to write logfiles to persistent disk"
  desc  "
    Data from journald may be stored in volatile memory or persisted locally on the server.  Logs in memory will be lost upon a system reboot.  By persisting logs to local disk on the server they are protected from loss.
    
    Rationale: Writing log data to disk will provide the ability to forensically reconstruct events which may have impacted the operations or security of a system even after a system crash or reboot.
  "
  impact 1.0
  describe file("/etc/systemd/journald.conf") do
    its("content") { should match(/^\s*(?i)Storage\s*=\s*persistent(\s+#.*)*$/) }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_4.2.3_Ensure_permissions_on_all_logfiles_are_configured" do
  title "Ensure permissions on all logfiles are configured"
  desc  "
    Log files stored in /var/log/ contain logged information from many services on the system, or on log hosts others as well.
    
    Rationale: It is important to ensure that log files have the correct permissions to ensure that sensitive data is archived and protected.
  "
  impact 1.0
  command('find /var/log -type f').stdout.split("\n").each do |log_file|
    describe file(log_file) do
      it { should_not be_writable.by('group') }
      it { should_not be_executable.by('group') }
      it { should_not be_readable.by('other') }
      it { should_not be_writable.by('other') }
      it { should_not be_executable.by('other') }
    end
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_4.3_Ensure_logrotate_is_configured" do
  title "Ensure logrotate is configured"
  desc  "
    The system includes the capability of rotating log files regularly to avoid filling up the system with logs or making the logs unmanageably large. The file /etc/logrotate.d/syslog is the configuration file used to rotate log files created by syslog or rsyslog .
    
    Rationale: By keeping the log files smaller and more manageable, a system administrator can easily archive these files to another system and spend less time looking through inordinately large log files.
  "
  impact 0.0
  describe file('/etc/logrotate.d/syslog') do
    its('content') { should match %r{^\/var\/log\/cron} }
    its('content') { should match %r{^\/var\/log\/maillog} }
    its('content') { should match %r{^\/var\/log\/messages} }
    its('content') { should match %r{^\/var\/log\/secure} }
    its('content') { should match %r{^\/var\/log\/spooler} }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_5.1.1_Ensure_cron_daemon_is_enabled" do
  title "Ensure cron daemon is enabled"
  desc  "
    The cron daemon is used to execute batch jobs on the system.
    
    Rationale: While there may not be user jobs that need to be run on the system, the system does have maintenance jobs that may include security monitoring that have to run, and cron is used to execute them.
  "
  impact 1.0
  describe service("crond") do
    it { should be_enabled }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_5.1.2_Ensure_permissions_on_etccrontab_are_configured" do
  title "Ensure permissions on /etc/crontab are configured"
  desc  "
    The /etc/crontab file is used by cron to control its own jobs. The commands in this item make sure that root is the user and group owner of the file and that only the owner can access the file.
    
    Rationale: This file contains information on what system jobs are run by cron. Write access to these files could provide unprivileged users with the ability to elevate their privileges. Read access to these files could provide users with the ability to gain insight on system jobs that run on the system and could provide them a way to gain unauthorized privileged access.
  "
  impact 1.0
  describe file("/etc/crontab") do
    it { should exist }
  end
  describe file("/etc/crontab") do
    it { should_not be_executable.by "group" }
  end
  describe file("/etc/crontab") do
    it { should_not be_readable.by "group" }
  end
  describe file("/etc/crontab") do
    its("gid") { should cmp 0 }
  end
  describe file("/etc/crontab") do
    it { should_not be_writable.by "group" }
  end
  describe file("/etc/crontab") do
    it { should_not be_executable.by "other" }
  end
  describe file("/etc/crontab") do
    it { should_not be_readable.by "other" }
  end
  describe file("/etc/crontab") do
    it { should_not be_writable.by "other" }
  end
  describe file("/etc/crontab") do
    its("uid") { should cmp 0 }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_5.1.3_Ensure_permissions_on_etccron.hourly_are_configured" do
  title "Ensure permissions on /etc/cron.hourly are configured"
  desc  "
    This directory contains system cron jobs that need to run on an hourly basis. The files in this directory cannot be manipulated by the crontab command, but are instead edited by system administrators using a text editor. The commands below restrict read/write and search access to user and group root, preventing regular users from accessing this directory.
    
    Rationale: Granting write access to this directory for non-privileged users could provide them the means for gaining unauthorized elevated privileges. Granting read access to this directory could give an unprivileged user insight in how to gain elevated privileges or circumvent auditing controls.
  "
  impact 1.0
  describe file("/etc/cron.hourly") do
    it { should exist }
  end
  describe file("/etc/cron.hourly") do
    it { should_not be_executable.by "group" }
  end
  describe file("/etc/cron.hourly") do
    it { should_not be_readable.by "group" }
  end
  describe file("/etc/cron.hourly") do
    its("gid") { should cmp 0 }
  end
  describe file("/etc/cron.hourly") do
    it { should_not be_writable.by "group" }
  end
  describe file("/etc/cron.hourly") do
    it { should_not be_executable.by "other" }
  end
  describe file("/etc/cron.hourly") do
    it { should_not be_readable.by "other" }
  end
  describe file("/etc/cron.hourly") do
    it { should_not be_writable.by "other" }
  end
  describe file("/etc/cron.hourly") do
    its("uid") { should cmp 0 }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_5.1.4_Ensure_permissions_on_etccron.daily_are_configured" do
  title "Ensure permissions on /etc/cron.daily are configured"
  desc  "
    The /etc/cron.daily directory contains system cron jobs that need to run on a daily basis. The files in this directory cannot be manipulated by the crontab command, but are instead edited by system administrators using a text editor. The commands below restrict read/write and search access to user and group root, preventing regular users from accessing this directory.
    
    Rationale: Granting write access to this directory for non-privileged users could provide them the means for gaining unauthorized elevated privileges. Granting read access to this directory could give an unprivileged user insight in how to gain elevated privileges or circumvent auditing controls.
  "
  impact 1.0
  describe file("/etc/cron.daily") do
    it { should exist }
  end
  describe file("/etc/cron.daily") do
    it { should_not be_executable.by "group" }
  end
  describe file("/etc/cron.daily") do
    it { should_not be_readable.by "group" }
  end
  describe file("/etc/cron.daily") do
    its("gid") { should cmp 0 }
  end
  describe file("/etc/cron.daily") do
    it { should_not be_writable.by "group" }
  end
  describe file("/etc/cron.daily") do
    it { should_not be_executable.by "other" }
  end
  describe file("/etc/cron.daily") do
    it { should_not be_readable.by "other" }
  end
  describe file("/etc/cron.daily") do
    it { should_not be_writable.by "other" }
  end
  describe file("/etc/cron.daily") do
    its("uid") { should cmp 0 }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_5.1.5_Ensure_permissions_on_etccron.weekly_are_configured" do
  title "Ensure permissions on /etc/cron.weekly are configured"
  desc  "
    The /etc/cron.weekly directory contains system cron jobs that need to run on a weekly basis. The files in this directory cannot be manipulated by the crontab command, but are instead edited by system administrators using a text editor. The commands below restrict read/write and search access to user and group root, preventing regular users from accessing this directory.
    
    Rationale: Granting write access to this directory for non-privileged users could provide them the means for gaining unauthorized elevated privileges. Granting read access to this directory could give an unprivileged user insight in how to gain elevated privileges or circumvent auditing controls.
  "
  impact 1.0
  describe file("/etc/cron.weekly") do
    it { should exist }
  end
  describe file("/etc/cron.weekly") do
    it { should_not be_executable.by "group" }
  end
  describe file("/etc/cron.weekly") do
    it { should_not be_readable.by "group" }
  end
  describe file("/etc/cron.weekly") do
    its("gid") { should cmp 0 }
  end
  describe file("/etc/cron.weekly") do
    it { should_not be_writable.by "group" }
  end
  describe file("/etc/cron.weekly") do
    it { should_not be_executable.by "other" }
  end
  describe file("/etc/cron.weekly") do
    it { should_not be_readable.by "other" }
  end
  describe file("/etc/cron.weekly") do
    it { should_not be_writable.by "other" }
  end
  describe file("/etc/cron.weekly") do
    its("uid") { should cmp 0 }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_5.1.6_Ensure_permissions_on_etccron.monthly_are_configured" do
  title "Ensure permissions on /etc/cron.monthly are configured"
  desc  "
    The /etc/cron.monthly directory contains system cron jobs that need to run on a monthly basis. The files in this directory cannot be manipulated by the crontab command, but are instead edited by system administrators using a text editor. The commands below restrict read/write and search access to user and group root, preventing regular users from accessing this directory.
    
    Rationale: Granting write access to this directory for non-privileged users could provide them the means for gaining unauthorized elevated privileges. Granting read access to this directory could give an unprivileged user insight in how to gain elevated privileges or circumvent auditing controls.
  "
  impact 1.0
  describe file("/etc/cron.monthly") do
    it { should exist }
  end
  describe file("/etc/cron.monthly") do
    it { should_not be_executable.by "group" }
  end
  describe file("/etc/cron.monthly") do
    it { should_not be_readable.by "group" }
  end
  describe file("/etc/cron.monthly") do
    its("gid") { should cmp 0 }
  end
  describe file("/etc/cron.monthly") do
    it { should_not be_writable.by "group" }
  end
  describe file("/etc/cron.monthly") do
    it { should_not be_executable.by "other" }
  end
  describe file("/etc/cron.monthly") do
    it { should_not be_readable.by "other" }
  end
  describe file("/etc/cron.monthly") do
    it { should_not be_writable.by "other" }
  end
  describe file("/etc/cron.monthly") do
    its("uid") { should cmp 0 }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_5.1.7_Ensure_permissions_on_etccron.d_are_configured" do
  title "Ensure permissions on /etc/cron.d are configured"
  desc  "
    The /etc/cron.d directory contains system cron jobs that need to run in a similar manner to the hourly, daily weekly and monthly jobs from /etc/crontab , but require more granular control as to when they run. The files in this directory cannot be manipulated by the crontab command, but are instead edited by system administrators using a text editor. The commands below restrict read/write and search access to user and group root, preventing regular users from accessing this directory.
    
    Rationale: Granting write access to this directory for non-privileged users could provide them the means for gaining unauthorized elevated privileges. Granting read access to this directory could give an unprivileged user insight in how to gain elevated privileges or circumvent auditing controls.
  "
  impact 1.0
  describe file("/etc/cron.d") do
    it { should exist }
  end
  describe file("/etc/cron.d") do
    it { should_not be_executable.by "group" }
  end
  describe file("/etc/cron.d") do
    it { should_not be_readable.by "group" }
  end
  describe file("/etc/cron.d") do
    its("gid") { should cmp 0 }
  end
  describe file("/etc/cron.d") do
    it { should_not be_writable.by "group" }
  end
  describe file("/etc/cron.d") do
    it { should_not be_executable.by "other" }
  end
  describe file("/etc/cron.d") do
    it { should_not be_readable.by "other" }
  end
  describe file("/etc/cron.d") do
    it { should_not be_writable.by "other" }
  end
  describe file("/etc/cron.d") do
    its("uid") { should cmp 0 }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_5.1.8_Ensure_atcron_is_restricted_to_authorized_users" do
  title "Ensure at/cron is restricted to authorized users"
  desc  "
    Configure /etc/cron.allow and /etc/at.allow to allow specific users to use these services. If /etc/cron.allow or /etc/at.allow do not exist, then /etc/at.deny and /etc/cron.deny are checked. Any user not specifically defined in those files is allowed to use at and cron. By removing the files, only users in /etc/cron.allow and /etc/at.allow are allowed to use at and cron. Note that even though a given user is not listed in cron.allow , cron jobs can still be run as that user. The cron.allow file only controls administrative access to the crontab command for scheduling and modifying cron jobs.
    
    Rationale: On many systems, only the system administrator is authorized to schedule cron jobs. Using the cron.allow file to control who can run cron jobs enforces this policy. It is easier to manage an allow list than a deny list. In a deny list, you could potentially add a user ID to the system and forget to add it to the deny files.
  "
  impact 1.0
  describe file("/etc/at.allow") do
    it { should exist }
  end
  describe file("/etc/at.allow") do
    it { should_not be_executable.by "group" }
  end
  describe file("/etc/at.allow") do
    it { should_not be_readable.by "group" }
  end
  describe file("/etc/at.allow") do
    its("gid") { should cmp 0 }
  end
  describe file("/etc/at.allow") do
    it { should_not be_writable.by "group" }
  end
  describe file("/etc/at.allow") do
    it { should_not be_executable.by "other" }
  end
  describe file("/etc/at.allow") do
    it { should_not be_readable.by "other" }
  end
  describe file("/etc/at.allow") do
    it { should_not be_writable.by "other" }
  end
  describe file("/etc/at.allow") do
    its("uid") { should cmp 0 }
  end
  describe file("/etc/cron.deny") do
    it { should_not exist }
  end
  describe file("/etc/at.deny") do
    it { should_not exist }
  end
  describe file("/etc/cron.allow") do
    it { should exist }
  end
  describe file("/etc/cron.allow") do
    it { should_not be_executable.by "group" }
  end
  describe file("/etc/cron.allow") do
    it { should_not be_readable.by "group" }
  end
  describe file("/etc/cron.allow") do
    its("gid") { should cmp 0 }
  end
  describe file("/etc/cron.allow") do
    it { should_not be_writable.by "group" }
  end
  describe file("/etc/cron.allow") do
    it { should_not be_executable.by "other" }
  end
  describe file("/etc/cron.allow") do
    it { should_not be_readable.by "other" }
  end
  describe file("/etc/cron.allow") do
    it { should_not be_writable.by "other" }
  end
  describe file("/etc/cron.allow") do
    its("uid") { should cmp 0 }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_5.2.1_Ensure_permissions_on_etcsshsshd_config_are_configured" do
  title "Ensure permissions on /etc/ssh/sshd_config are configured"
  desc  "
    The /etc/ssh/sshd_config file contains configuration specifications for sshd . The command below sets the owner and group of the file to root.
    
    Rationale: The /etc/ssh/sshd_config file needs to be protected from unauthorized changes by non-privileged users.
  "
  impact 1.0
  describe.one do
    describe file("/etc/ssh/sshd_config") do
      it { should exist }
    end
    describe file("/etc/ssh/sshd_config") do
      it { should_not be_executable.by "group" }
    end
    describe file("/etc/ssh/sshd_config") do
      it { should_not be_readable.by "group" }
    end
    describe file("/etc/ssh/sshd_config") do
      its("gid") { should cmp 0 }
    end
    describe file("/etc/ssh/sshd_config") do
      it { should_not be_writable.by "group" }
    end
    describe file("/etc/ssh/sshd_config") do
      it { should_not be_executable.by "other" }
    end
    describe file("/etc/ssh/sshd_config") do
      it { should_not be_readable.by "other" }
    end
    describe file("/etc/ssh/sshd_config") do
      it { should_not be_writable.by "other" }
    end
    describe file("/etc/ssh/sshd_config") do
      its("uid") { should cmp 0 }
    end
    describe package("openssh-server") do
      it { should_not be_installed }
    end
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_5.2.2_Ensure_SSH_access_is_limited" do
  title "Ensure SSH access is limited"
  desc  "
    There are several options available to limit which users and group can access the system via SSH. It is recommended that at least one of the following options be leveraged:
    
    * AllowUsers : *  The AllowUsers variable gives the system administrator the option of allowing specific users to ssh into the system. The list consists of space separated user names. Numeric user IDs are not recognized with this variable. If a system administrator wants to restrict user access further by only allowing the allowed users to log in from a particular host, the entry can be specified in the form of user@host.
    * AllowGroups : *  The AllowGroups variable gives the system administrator the option of allowing specific groups of users to ssh into the system. The list consists of space separated group names. Numeric group IDs are not recognized with this variable.
    * DenyUsers : *  The DenyUsers variable gives the system administrator the option of denying specific users to ssh into the system. The list consists of space separated user names. Numeric user IDs are not recognized with this variable. If a system administrator wants to restrict user access further by specifically denying a user's access from a particular host, the entry can be specified in the form of user@host.
    * DenyGroups : *  The DenyGroups variable gives the system administrator the option of denying specific groups of users to ssh into the system. The list consists of space separated group names. Numeric group IDs are not recognized with this variable.
    
    Rationale: Restricting which users can remotely access the system via SSH will help ensure that only authorized users access the system.
  "
  impact 1.0
  describe.one do
    describe file('/etc/ssh/sshd_config') do
      its('content') { should match(/^\s*(AllowUsers|AllowGroups|DenyUsers|DenyGroups)\s+(\S+)/) }
    end
    describe package('openssh-server') do
      it { should_not be_installed }
    end
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_5.2.3_Ensure_permissions_on_SSH_private_host_key_files_are_configured" do
  title "Ensure permissions on SSH private host key files are configured"
  desc  "
    An SSH private key is one of two files used in SSH public key authentication.  In this authentication method, the possession of the private key is proof of identity. Only a private key that corresponds to a public key will be able to authenticate successfully. The private keys need to be stored and handled carefully, and no copies of the private key should be distributed.
    
    Rationale: If an unauthorized user obtains the private SSH host key file, the host could be impersonated
  "
  impact 1.0
  describe.one do
    describe file("/etc/ssh/^(ssh\\_host\\_.*\\_key)$") do
      it { should exist }
    end
    describe file("/etc/ssh/^(ssh\\_host\\_.*\\_key)$") do
      it { should_not be_executable.by "group" }
    end
    describe file("/etc/ssh/^(ssh\\_host\\_.*\\_key)$") do
      it { should_not be_writable.by "group" }
    end
    describe file("/etc/ssh/^(ssh\\_host\\_.*\\_key)$") do
      it { should_not be_executable.by "other" }
    end
    describe file("/etc/ssh/^(ssh\\_host\\_.*\\_key)$") do
      it { should_not be_readable.by "other" }
    end
    describe file("/etc/ssh/^(ssh\\_host\\_.*\\_key)$") do
      it { should_not be_writable.by "other" }
    end
    describe package("openssh-server") do
      it { should_not be_installed }
    end
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_5.2.4_Ensure_permissions_on_SSH_public_host_key_files_are_configured" do
  title "Ensure permissions on SSH public host key files are configured"
  desc  "
    An SSH public key is one of two files used in SSH public key authentication. In this authentication method, a public key is a key that can be used for verifying digital signatures generated using a corresponding private key. Only a public key that corresponds to a private key will be able to authenticate successfully.
    
    Rationale: If a public host key file is modified by an unauthorized user, the SSH service may be compromised.
  "
  impact 1.0
  describe.one do
    describe file("/etc/ssh/^(ssh\\_host\\_.*\\_key\\.pub)$") do
      it { should exist }
    end
    describe file("/etc/ssh/^(ssh\\_host\\_.*\\_key\\.pub)$") do
      it { should_not be_executable.by "group" }
    end
    describe file("/etc/ssh/^(ssh\\_host\\_.*\\_key\\.pub)$") do
      its("gid") { should cmp 0 }
    end
    describe file("/etc/ssh/^(ssh\\_host\\_.*\\_key\\.pub)$") do
      it { should_not be_writable.by "group" }
    end
    describe file("/etc/ssh/^(ssh\\_host\\_.*\\_key\\.pub)$") do
      it { should_not be_executable.by "other" }
    end
    describe file("/etc/ssh/^(ssh\\_host\\_.*\\_key\\.pub)$") do
      it { should_not be_writable.by "other" }
    end
    describe package("openssh-server") do
      it { should_not be_installed }
    end
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_5.2.5_Ensure_SSH_LogLevel_is_appropriate" do
  title "Ensure SSH LogLevel is appropriate"
  desc  "
    INFO level is the basic level that only records login activity of SSH users. In many situations, such as Incident Response, it is important to determine when a particular user was active on a system. The logout record can eliminate those users who disconnected, which helps narrow the field.
    
    VERBOSE level specifies that login and logout activity as well as the key fingerprint for any SSH key used for login will be logged. This information is important for SSH key management, especially in legacy environments.
    
    Rationale: SSH provides several logging levels with varying amounts of verbosity. DEBUG is specifically **not** recommended other than strictly for debugging SSH communications since it provides so much data that it is difficult to identify important security information.
  "
  impact 1.0
  describe.one do
    describe sshd_config do
      its('LogLevel') { should match(/^(VERBOSE|INFO)$/) }
    end
    describe file("/etc/ssh/sshd_config") do
      its("content") { should_not match(/^(?i)\s*LogLevel\s+(QUIET|FATAL|ERROR|DEBUG|DEBUG1|DEBUG2|DEBUG3)/) }
    end
    describe package("openssh-server") do
      it { should_not be_installed }
    end
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_5.2.7_Ensure_SSH_MaxAuthTries_is_set_to_4_or_less" do
  title "Ensure SSH MaxAuthTries is set to 4 or less"
  desc  "
    The MaxAuthTries parameter specifies the maximum number of authentication attempts permitted per connection. When the login failure count reaches half the number, error messages will be written to the syslog file detailing the login failure.
    
    Rationale: Setting the MaxAuthTries parameter to a low number will minimize the risk of successful brute force attacks to the SSH server. While the recommended setting is 4, set the number based on site policy.
  "
  impact 1.0
  describe.one do
    describe sshd_config do
      its('MaxAuthTries') { should cmp <= 4 }
    end
    describe package("openssh-server") do
      it { should_not be_installed }
    end
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_5.2.8_Ensure_SSH_IgnoreRhosts_is_enabled" do
  title "Ensure SSH IgnoreRhosts is enabled"
  desc  "
    The IgnoreRhosts parameter specifies that .rhosts and .shosts files will not be used in RhostsRSAAuthentication or HostbasedAuthentication .
    
    Rationale: Setting this parameter forces users to enter a password when authenticating with ssh.
  "
  impact 1.0
  describe.one do
    describe file("/etc/ssh/sshd_config") do
      its("content") { should_not match(/^(?i)\s*ignorerhosts\s+no\b/) }
    end
    describe package("openssh-server") do
      it { should_not be_installed }
    end
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_5.2.9_Ensure_SSH_HostbasedAuthentication_is_disabled" do
  title "Ensure SSH HostbasedAuthentication is disabled"
  desc  "
    The HostbasedAuthentication parameter specifies if authentication is allowed through trusted hosts via the user of .rhosts , or /etc/hosts.equiv , along with successful public key client host authentication. This option only applies to SSH Protocol Version 2.
    
    Rationale: Even though the .rhosts files are ineffective if support is disabled in /etc/pam.conf , disabling the ability to use .rhosts files in SSH provides an additional layer of protection.
  "
  impact 1.0
  describe.one do
   describe file("/etc/ssh/sshd_config") do
     its("content") { should_not match(/^(?i)\s*HostbasedAuthentication\s+yes/) }
   end
   describe package("openssh-server") do
     it { should_not be_installed }
   end
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_5.2.10_Ensure_SSH_root_login_is_disabled" do
  title "Ensure SSH root login is disabled"
  desc  "
    The PermitRootLogin parameter specifies if the root user can log in using ssh. The default is no.
    
    Rationale: Disallowing root logins over SSH requires system admins to authenticate using their own individual account, then escalating to root via sudo or su . This in turn limits opportunity for non-repudiation and provides a clear audit trail in the event of a security incident
  "
  impact 1.0
  describe.one do
    describe file("/etc/ssh/sshd_config") do
      its("content") { should_not match(/^(?i)\s*PermitRootLogin\s+yes/) }
    end
    describe package("openssh-server") do
      it { should_not be_installed }
    end
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_5.2.11_Ensure_SSH_PermitEmptyPasswords_is_disabled" do
  title "Ensure SSH PermitEmptyPasswords is disabled"
  desc  "
    The PermitEmptyPasswords parameter specifies if the SSH server allows login to accounts with empty password strings.
    
    Rationale: Disallowing remote shell access to accounts that have an empty password reduces the probability of unauthorized access to the system
  "
  impact 1.0
  describe sshd_config do
    its('PermitEmptyPasswords') { should eq 'no' }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_5.2.12_Ensure_SSH_PermitUserEnvironment_is_disabled" do
  title "Ensure SSH PermitUserEnvironment is disabled"
  desc  "
    The PermitUserEnvironment option allows users to present environment options to the ssh daemon.
    
    Rationale: Permitting users the ability to set environment variables through the SSH daemon could potentially allow users to bypass security controls (e.g. setting an execution path that has ssh executing trojan'd programs)
  "
  impact 1.0
  describe sshd_config do
    its('PermitUserEnvironment') { should eq 'no' }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_5.2.13_Ensure_SSH_Idle_Timeout_Interval_is_configured" do
  title "Ensure SSH Idle Timeout Interval is configured"
  desc  "
    The two options ClientAliveInterval and ClientAliveCountMax control the timeout of ssh sessions.
    
    * ClientAliveInterval sets a timeout interval in seconds after which if no data has been received from the client, sshd will send a message through the encrypted channel to request a response from the client. The default is 0, indicating that these messages will not be sent to the client.
    * ClientAliveCountMax sets the number of client alive messages which may be sent without sshd receiving any messages back from the client. If this threshold is reached while client alive messages are being sent, sshd will disconnect the client, terminating the session. The default value is 3 . * The client alive messages are sent through the encrypted channel
    *  Setting ClientAliveCountMax to 0 disables connection termination
    ** Example: The default value is 3.  If ClientAliveInterval is set to 15, and ClientAliveCountMax is left at the default, unresponsive SSH clients will be disconnected after approximately 45 seconds **
    
    Rationale: Having no timeout value associated with a connection could allow an unauthorized user access to another user's ssh session (e.g. user walks away from their computer and doesn't lock the screen). Setting a timeout value reduces this risk.
    
    *  The recommended ClientAliveInterval setting is no greater than 900 seconds (15 minutes)
    *  The recommended ClientAliveCountMax setting is 0
    * At the 15 minute interval, if the ssh session is inactive, the session will be terminated.
  "
  impact 1.0
  describe sshd_config do
    its('ClientAliveInterval') { should cmp <=  900 }
    its('ClientAliveInterval') { should cmp > 0 }
    its('ClientAliveCountMax') { should cmp <= 3 }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_5.2.14_Ensure_SSH_LoginGraceTime_is_set_to_one_minute_or_less" do
  title "Ensure SSH LoginGraceTime is set to one minute or less"
  desc  "
    The LoginGraceTime parameter specifies the time allowed for successful authentication to the SSH server. The longer the Grace period is the more open unauthenticated connections can exist. Like other session controls in this session the Grace Period should be limited to appropriate organizational limits to ensure the service is available for needed access.
    
    Rationale: Setting the LoginGraceTime parameter to a low number will minimize the risk of successful brute force attacks to the SSH server. It will also limit the number of concurrent unauthenticated connections While the recommended setting is 60 seconds (1 Minute), set the number based on site policy.
  "
  impact 1.0
  describe sshd_config do
    its('LoginGraceTime') { should cmp <= 60 }
    its('LoginGraceTime') { should cmp > 0 }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_5.2.15_Ensure_SSH_warning_banner_is_configured" do
  title "Ensure SSH warning banner is configured"
  desc  "
    The Banner parameter specifies a file whose contents must be sent to the remote user before authentication is permitted. By default, no banner is displayed.
    
    Rationale: Banners are used to warn connecting users of the particular site's policy regarding connection. Presenting a warning message prior to the normal user login may assist the prosecution of trespassers on the computer system.
  "
  impact 1.0
  describe sshd_config do
    its('Banner') {should eq '/etc/issue.net'}
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_5.2.16_Ensure_SSH_PAM_is_enabled" do
  title "Ensure SSH PAM is enabled"
  desc  "
    UsePAM Enables the Pluggable Authentication Module interface. If set to &#x201C;yes&#x201D; this will enable PAM authentication using ChallengeResponseAuthentication and PasswordAuthentication in addition to PAM account and session module processing for all authentication types
    
    Rationale: When usePAM is set to yes, PAM runs through account and session types properly.  This is important if you want to restrict access to services based off of IP, time or other factors of the account. Additionally, you can make sure users inherit certain environment variables on login or disallow access to the server
  "
  impact 1.0
  describe sshd_config do
    its('UsePAM') { should cmp 'yes' }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_5.2.18_Ensure_SSH_MaxStartups_is_configured" do
  title "Ensure SSH MaxStartups is configured"
  desc  "
    The MaxStartups parameter specifies the  maximum number of concurrent unauthenticated connections to the SSH daemon.
    
    Rationale: To protect a system from denial of service due to a large number of pending authentication connection attempts, use the rate limiting function of MaxStartups to protect availability of sshd logins and prevent overwhelming the daemon.
  "
  impact 1.0
  describe sshd_config do
    its('MaxStartups') { should eq '10:30:60' }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_5.2.19_Ensure_SSH_MaxSessions_is_set_to_4_or_less" do
  title "Ensure SSH MaxSessions is set to 4 or less"
  desc  "
    The MaxSessions parameter specifies the maximum number of open sessions permitted from a given connection.
    
    Rationale: To protect a system from denial of service due to a large number of concurrent sessions, use the rate limiting function of MaxSessions to protect availability of sshd logins and prevent overwhelming the daemon.
  "
  impact 1.0
  describe sshd_config do
    its('MaxSessions') { should cmp <= 10 }
    its('MaxSessions') { should cmp > 0 }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_5.2.20_Ensure_system-wide_crypto_policy_is_not_over-ridden" do
  title "Ensure system-wide crypto policy is not over-ridden"
  desc  "
    System-wide Crypto policy can be over-ridden or opted out of for openSSH
    
    Rationale: Over-riding or opting out of the system-wide crypto policy could allow for the use of less secure Ciphers, MACs, KexAlgoritms and GSSAPIKexAlgorithsm
  "
  impact 1.0
  describe.one do
    describe file("/etc/sysconfig/sshd") do
      its("content") { should_not match(/(?i)^\h*CRYPTO_POLICY\h*=.*$/) }
    end
    describe package("openssh-server") do
      it { should_not be_installed }
    end
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_5.3.1_Create_custom_authselect_profile" do
  title "Create custom authselect profile"
  desc  "
    A custom profile can be created by copying and customizing one of the default profiles.  The default profiles include: sssd, winbind, or the nis.
    
    Rationale: A custom profile is required to customize many of the pam options
  "
  impact 1.0
  describe command("authselect current | grep 'Profile ID:'") do
    its('stdout') { should match(/^\s*Profile\s+ID:\s+sssd/) }
    its('exit_status') { should eq 0 }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_5.3.2_Select_authselect_profile" do
  title "Select authselect profile"
  desc  "
    You can select a profile for the authselect utility for a specific host. The profile will be applied to every user logging into the host.
    
    You can create and deploy a custom profile by customizing one of the default profiles, the sssd, winbind, or the nis profile.
    
    Rationale: When you deploy a profile, the profile is applied to every user logging into the given host
  "
  impact 1.0
  describe file("/etc/authselect/authselect.conf") do
    its("content") { should match(/^\s*custom\/\S+\s*(\s+#.*)?$/) }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_5.3.3_Ensure_authselect_includes_with-faillock" do
  title "Ensure authselect includes with-faillock"
  desc  "
    The pam_faillock.so module maintains a list of failed authentication attempts per user during a specified interval and locks the account in case there were more than deny consecutive failed authentications. It stores the failure records into per-user files in the tally directory
    
    Rationale: Locking out user IDs after n unsuccessful consecutive login attempts mitigates brute force password attacks against your systems.
  "
  impact 1.0
  describe file('/etc/authselect/authselect.conf') do
    its('content') { should match(/^\s*with-faillock/) }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_5.4.1_Ensure_password_creation_requirements_are_configured" do
  title "Ensure password creation requirements are configured"
  desc  "
    The pam_pwquality.so module checks the strength of passwords. It performs checks such as making sure a password is not a dictionary word, it is a certain length, contains a mix of characters (e.g. alphabet, numeric, other) and more. The following are definitions of the pam_pwquality.so options.
    
    * try_first_pass - retrieve the password from a previous stacked PAM module. If not available, then prompt the user for a password.
    * retry=3 - Allow 3 tries before sending back a failure.
    * minlen=14 - password must be 14 characters or more
    ** Either of the following can be used to enforce complex passwords:**
    
    * minclass=4 - provide at least four classes of characters for the new password
    **OR**
    
    * dcredit=-1 - provide at least one digit
    * ucredit=-1 - provide at least one uppercase character
    * ocredit=-1 - provide at least one special character
    * lcredit=-1 - provide at least one lowercase character
    The settings shown above are one possible policy. Alter these values to conform to your own organization's password policies
    
    Rationale: Strong passwords protect systems from being hacked through brute force methods.
  "
  impact 1.0
  describe file("/etc/pam.d/password-auth") do
    its("content") { should match(/^\s*password\s+requisite\s+pam_pwquality.so\s+(\S+\s+)*retry=[1-3]\s*(\s+\S+\s*)*(\s+#.*)*$/) }
  end
  describe file("/etc/pam.d/system-auth") do
    its("content") { should match(/^\s*password\s+requisite\s+pam_pwquality.so\s+(\S+\s+)*retry=[1-3]\s*(\s+\S+\s*)*(\s+#.*)*$/) }
  end
  describe file("/etc/security/pwquality.conf") do
    its("content") { should match(/^\s*minlen\s*=\s*(1[4-9]|[2-9][0-9]|[1-9][0-9][0-9])(\s+#.*)*$/) }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_5.4.2_Ensure_lockout_for_failed_password_attempts_is_configured" do
  title "Ensure lockout for failed password attempts is configured"
  desc  "
    Lock out users after **n** unsuccessful consecutive login attempts.
    
    * deny= - Number of attempts before the account is locked
    
    * unlock_time= - Time in seconds before the account is unlocked
    
    Set the lockout number and unlock time to follow local site policy.
    
    Rationale: Locking out user IDs after **n** unsuccessful consecutive login attempts mitigates brute force password attacks against your systems.
  "
  impact 1.0
  describe file("/etc/pam.d/password-auth") do
    its("content") { should match(/^\s*auth\s+required\s+.*\s+deny=[1-5]\s*.*$/) }
  end
  describe file("/etc/pam.d/password-auth") do
    its("content") { should match(/^\s*auth\s+required\s+.*\s+unlock_time=(9[0-9][0-9]|[1-9][0-9][0-9][0-9])\s*.*$/) }
  end
  describe file("/etc/pam.d/system-auth") do
    its("content") { should match(/^\s*auth\s+required\s+.*\s+deny=[1-5]\s*.*$/) }
  end
  describe file("/etc/pam.d/system-auth") do
    its("content") { should match(/^\s*auth\s+required\s+.*\s+unlock_time=(9[0-9][0-9]|[1-9][0-9][0-9][0-9])\s*.*$/) }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_5.4.3_Ensure_password_reuse_is_limited" do
  title "Ensure password reuse is limited"
  desc  "
    The /etc/security/opasswd file stores the users' old passwords and can be checked to ensure that users are not recycling recent passwords.
    
    * remember=5&gt; - Number of old passwords to remember
    
    Rationale: Forcing users not to reuse their past 5 passwords make it less likely that an attacker will be able to guess the password.
    
    **Note:** These change only apply to accounts configured on the local system.
  "
  impact 1.0
  describe file("/etc/pam.d/system-auth") do
    its("content") { should match(/^password\s+sufficient\s+pam_unix\.so\s+(\S+\s+)*remember=([56789]|[1-9][0-9]+)/) }
  end
  describe file("/etc/pam.d/password-auth") do
    its("content") { should match(/^password\s+sufficient\s+pam_unix\.so\s+(\S+\s+)*remember=([56789]|[1-9][0-9]+)/) }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_5.4.4_Ensure_password_hashing_algorithm_is_SHA-512" do
  title "Ensure password hashing algorithm is SHA-512"
  desc  "
    The commands below change password encryption from md5 to sha512 (a much stronger hashing algorithm). All existing accounts will need to perform a password change to upgrade the stored hashes to the new algorithm.
    
    Rationale: The SHA-512 algorithm provides much stronger hashing than MD5, thus providing additional protection to the system by increasing the level of effort for an attacker to successfully determine passwords.
    
    Note that these changes only apply to accounts configured on the local system.
  "
  impact 1.0
  describe file("/etc/pam.d/password-auth") do
    its("content") { should match(/^\s*password\s+sufficient\s+pam_unix.so\s+.*sha512\s*.*$/) }
  end
  describe file("/etc/pam.d/system-auth") do
    its("content") { should match(/^\s*password\s+sufficient\s+pam_unix.so\s+.*sha512\s*.*$/) }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_5.5.1.1_Ensure_password_expiration_is_365_days_or_less" do
  title "Ensure password expiration is 365 days or less"
  desc  "
    The PASS_MAX_DAYS parameter in /etc/login.defs allows an administrator to force passwords to expire once they reach a defined age.  It is recommended that the PASS_MAX_DAYS parameter be set to less than or equal to 365 days.
    
    Rationale: The window of opportunity for an attacker to leverage compromised credentials or successfully compromise credentials via an online brute force attack is limited by the age of the password. Therefore, reducing the maximum age of a password also reduces an attacker's window of opportunity.
  "
  impact 1.0
  describe file("/etc/login.defs") do
    its("content") { should match(/^\s*PASS_MAX_DAYS\s+(36[0-5]|3[0-5][0-9]|[1-2][0-9][0-9]|[1-9][0-9]?)\s*(\s+#.*)?$/) }
  end
  describe shadow.where { user =~ /.+/ and password =~ /^[^!*]/ and (max_days.nil? or max_days.to_i > 365) } do
    its("raw_data") { should be_empty }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_5.5.1.2_Ensure_minimum_days_between_password_changes_is_7_or_more" do
  title "Ensure minimum days between password changes is 7 or more"
  desc  "
    The PASS_MIN_DAYS parameter in /etc/login.defs allows an administrator to prevent users from changing their password until a minimum number of days have passed since the last time the user changed their password. It is recommended that PASS_MIN_DAYS parameter be set to 7 or more days.
    
    Rationale: By restricting the frequency of password changes, an administrator can prevent users from repeatedly changing their password in an attempt to circumvent password reuse controls.
  "
  impact 1.0
  describe file("/etc/login.defs") do
    its("content") { should match(/^\s*PASS_MIN_DAYS\s+([7-9]|[1-9][0-9]+)\s*(\s+#.*)?$/) }
  end
  describe file("/etc/shadow") do
    its("content") { should_not match(/^\S+:[^\!\*:]*:[^:]*:([0-6]|\-1):[^:]*:[^:]*:[^:]*:[^:]*:[^:]*\s*$/) }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_5.5.1.3_Ensure_password_expiration_warning_days_is_7_or_more" do
  title "Ensure password expiration warning days is 7 or more"
  desc  "
    The PASS_WARN_AGE parameter in /etc/login.defs allows an administrator to notify users that their password will expire in a defined number of days. It is recommended that the PASS_WARN_AGE parameter be set to 7 or more days.
    
    Rationale: Providing an advance warning that a password will be expiring gives users time to think of a secure password. Users caught unaware may choose a simple password or write it down where it may be discovered.
  "
  impact 1.0
  describe file("/etc/login.defs") do
    its("content") { should match(/^\s*PASS_WARN_AGE\s+([789]|[1-9][0-9]+)\s*(\s+#.*)?$/) }
  end
  describe shadow.where { user =~ /.+/ and password =~ /^[^!*]/ and (warn_days.nil? or warn_days.to_i < 7) } do
    its("raw_data") { should be_empty }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_5.5.1.4_Ensure_inactive_password_lock_is_30_days_or_less" do
  title "Ensure inactive password lock is 30 days or less"
  desc  "
    User accounts that have been inactive for over a given period of time can be automatically disabled. It is recommended that accounts that are inactive for 30 days after password expiration be disabled.
    
    Rationale: Inactive accounts pose a threat to system security since the users are not logging in to notice failed login attempts or other anomalies.
  "
  impact 1.0
  describe file("/etc/default/useradd") do
    its("content") { should match(/^\s*INACTIVE\s*=\s*(30|[1-2][0-9]|[1-9])\s*(\s+#.*)?$/) }
  end
  describe shadow.where { user =~ /.+/ and password =~ /^[^!*]/ and (inactive_days.nil? or inactive_days.to_i < 7) } do
    its("raw_data") { should be_empty }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_5.5.1.5_Ensure_all_users_last_password_change_date_is_in_the_past" do
  title "Ensure all users last password change date is in the past"
  desc  "
    All users should have a password change date in the past.
    
    Rationale: If a users recorded password change date is in the future then they could bypass any set password expiration.
  "
  impact 1.0
  cmd = %q(
          for usr in $(cut -d: -f1 /etc/shadow); do [[ $(chage --list $usr | grep '^Last password change' | cut -d: -f2) > $(date) ]] && echo "$usr :$(chage --list $usr | grep '^Last password change' | cut -d: -f2)"; done
          )
  
  describe command(cmd) do
    its('stdout') { should eq '' }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_5.5.2_Ensure_system_accounts_are_secured" do
  title "Ensure system accounts are secured"
  desc  "
    There are a number of accounts provided with most distributions that are used to manage applications and are not intended to provide an interactive shell.
    
    Rationale: It is important to make sure that accounts that are not being used by regular users are prevented from being used to provide an interactive shell. By default, most distributions set the password field for these accounts to an invalid string, but it is also recommended that the shell field in the password file be set to the nologin shell. This prevents the account from potentially being used to run any commands.
  "
  impact 1.0
  describe passwd.where { user =~ /^(?!root|sync|shutdown|halt).*$/ } do
    its("entries") { should_not be_empty }
  end
  describe passwd.where { user =~ /^(?!root|sync|shutdown|halt).*$/ && uid.to_i < 500 && shell != "/sbin/nologin" } do
    its("entries") { should be_empty }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_5.5.3_Ensure_default_user_shell_timeout_is_900_seconds_or_less" do
  title "Ensure default user shell timeout is 900 seconds or less"
  desc  "
    TMOUT is an environmental setting that determines the timeout of a shell in seconds.
    
    *  TMOUT= **n** - Sets the shell timeout to **n** seconds.  A setting of TMOUT=0 disables timeout.
    * readonly TMOUT- Sets the TMOUT environmental variable as readonly, preventing unwanted modification during run-time.
    * export TMOUT - exports the TMOUT variable
    System Wide Shell Configuration Files:
    
    * /etc/profile - used to set system wide environmental variables on users shells. The variables are sometimes the same ones that are in the .bash_profile , however this file is used to set an initial PATH or PS1 for all shell users of the system. ** is only executed for interactive **login** shells, or shells executed with the --login parameter. **
    * /etc/profile.d - /etc/profile will execute the scripts within /etc/profile.d/*.sh . It is recommended to place your configuration in a shell script within /etc/profile.d to set your own system wide environmental variables.
    * /etc/bashrc - System wide version of .bashrc .  In Fedora derived distributions, etc/bashrc also invokes /etc/profile.d/*.sh if **non-login** shell, but redirects output to /dev/null if **non-interactive.**** Is only executed for **interactive** shells or if BASH_ENV is set to /etc/bashrc . **
    
    Rationale: Setting a timeout value reduces the window of opportunity for unauthorized user access to another user's shell session that has been left unattended. It also ends the inactive session and releases the resources associated with that session.
  "
  impact 1.0
  describe bash("#!/usr/bin/env sh\n\n# CIS-CAT Script Check Engine\n#\n# Name         Date       Description\n# -------------------------------------------------------------------\n# E. Pinnell   04/01/20   Check that TMOUT is configured\n\npassing=\"\"\ntest1=\"\"\ntest2=\"\"\noutput1=\"\"\noutput2=\"\"\n\n[ -f /etc/bashrc ] && BRC=\"/etc/bashrc\"\n[ -f /etc/bash.bashrc ] && BRC=\"/etc/bash.bashrc\"\n\nfor f in \"$BRC\" /etc/profile /etc/profile.d/*.sh ; do\n\tif [ -f \"$f\" ] ; then\n\t\tgrep -Eq '(^|^[^#]*;)\\s*(readonly|export(\\s+[^$#;]+\\s*)*)?\\s*TMOUT=(900|[1-8][0-9][0-9]|[1-9][0-9]|[1-9])\\b' \"$f\" && grep -Eq '(^|^[^#]*;)\\s*readonly\\s+TMOUT\\b' \"$f\" && grep -Eq '(^|^[^#]*;)\\s*export\\s+([^$#;]+\\s+)*TMOUT\\b' \"$f\" && test1=y output1=\"$f\"\n\telse\n\t\tbreak\n\tfi\ndone\n! grep -Pq '(^|^[^#]*;)\\s*TMOUT=(9[0-9][1-9]|0+|[1-9]\\d{3,})\\b' /etc/profile /etc/profile.d/*.sh \"$BRC\" && test2=\"y\" || test2=\"n\"\n[ \"$test2\" = n ] && output2=$(grep -P '(^|^[^#]*;)\\s*TMOUT=(9[0-9][1-9]|0+|[1-9]\\d{3,})\\b' /etc/profile /etc/profile.d/*.sh $BRC)\n[ \"$test1\" = y ] && [ \"$test2\" = y ] && passing=true\n\n# If the tests all pass, we pass\nif [ \"$passing\" = true ] ; then\n\techo \"TMOUT is configured in: \\\"$output1\\\"\"\n    exit 0\nelse\n    # print the reason why we are failing\n    [ -z \"$output1\" ] && echo \"TMOUT is not configured\"\n    [ \"$test2\" = n ] && echo \"TMOUT is incorrectly configured in: \\\"$output2\\\"\"\n    exit 1\nfi") do
    its("exit_status") { should eq 0 }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_5.5.4_Ensure_default_group_for_the_root_account_is_GID_0" do
  title "Ensure default group for the root account is GID 0"
  desc  "
    The usermod command can be used to specify which group the root user belongs to. This affects permissions of files that are created by the root user.
    
    Rationale: Using GID 0 for the root account helps prevent root -owned files from accidentally becoming accessible to non-privileged users.
  "
  impact 1.0
  describe passwd.where { user == "root" } do
    its("entries") { should_not be_empty }
  end
  describe passwd.where { user == "root" && gid.to_i == 0 } do
    its("entries") { should_not be_empty }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_5.5.5_Ensure_default_user_umask_is_027_or_more_restrictive" do
  title "Ensure default user umask is 027 or more restrictive"
  desc  "
    The user file-creation mode mask ( umask ) is use to determine the file permission for newly created directories and files. In Linux, the default permissions for any newly created directory is 0777 (rwxrwxrwx), and for any newly created file it is 0666 (rw-rw-rw-). The umask modifies the default Linux permissions by restricting (masking) these permissions. The umask is not simply subtracted, but is processed bitwise. Bits set in the umask are cleared in the resulting file mode.
    
    umask can be set with either octal or Symbolic values:
    
    * Octal (Numeric) Value - Represented by either three or four digits. ie umask 0027 or umask 027 .  If a four digit umask is used, the first digit is ignored. The remaining three digits effect the resulting permissions for user, group, and world/other respectively.
    * Symbolic Value - Represented by a comma separated list for User u , group g , and world/other o .  The permissions listed are not masked by umask . ie a umask set by umask u=rwx,g=rx,o= is the Symbolic equivalent of the Octalumask 027 .  This umask would set a newly created directory with file mode drwxr-x--- and a newly created file with file mode rw-r----- .
    The default umask can be set to use the pam_umask module or in a System Wide Shell Configuration File .  The user creating the directories or files has the discretion of changing the permissions via the chmod command, or choosing a different default umask by adding the umask command into a User Shell Configuration File , ( .bash_profile or .bashrc ), in their home directory.
    
    Setting the default umask:
    
    *  pam_umask module: *  will set the umask according to the system default in /etc/login.defs and user settings, solving the problem of different umask settings with different shells, display managers, remote sessions etc.
    * umask=
    <mask> value in the /etc/login.defs file is interpreted as Octal
    *  Setting USERGROUPS_ENAB to yes in /etc/login.defs (default): *  will enable setting of the umask group bits to be the same as owner bits. (examples: 022 -&gt; 002, 077 -&gt; 007) for non-root users, if the uid is the same as gid , and username is the same as the <primary/>name&gt;
    * userdel will remove the user's group if it contains no more members, and useradd will create by default a group with the name of the user
    * System Wide Shell Configuration File : * /etc/profile - used to set system wide environmental variables on users shells. The variables are sometimes the same ones that are in the .bash_profile , however this file is used to set an initial PATH or PS1 for all shell users of the system. ** is only executed for interactive **login** shells, or shells executed with the --login parameter. **
    * /etc/profile.d - /etc/profile will execute the scripts within /etc/profile.d/*.sh . It is recommended to place your configuration in a shell script within /etc/profile.d to set your own system wide environmental variables.
    * /etc/bashrc - System wide version of .bashrc .  In Fedora derived distributions, etc/bashrc also invokes /etc/profile.d/*.sh if **non-login** shell, but redirects output to /dev/null if **non-interactive.**** Is only executed for **interactive** shells or if BASH_ENV is set to /etc/bashrc . **
    User Shell Configuration Files:
    
    * ~/.bash_profile - Is executed to configure your shell before the initial command prompt. **Is only read by login shells.**
    * ~/.bashrc - Is executed for interactive shells. **only read by a shell that's both interactive and non-login**</mask>
    
    Rationale: Setting a very secure default value for umask ensures that users make a conscious choice about their file permissions. A default umask setting of 077 causes files and directories created by users to not be readable by any other user on the system. A umask of 027 would make files and directories readable by users in the same Unix group, while a umask of 022 would make files readable by every user on the system.
  "
  impact 1.0
  describe file("/etc/bashrc") do
    its("content") { should match(/^\s*umask\s+[01234567][2367]7\s*(\s+#.*)?$/) }
    its("content") { should_not match(/^\s*umask\s+[01234567](0[7654321]|[7654321][654321])\s*(\s+#.*)?$/) }
  end
  describe.one do
    describe file("/etc/profile") do
      its("content") { should_not match(/^\s*umask\s+[01234567](0[7654321]|[7654321][654321])\s*(\s+#.*)?$/) }
    end
    files = command("find /etc/profile.d/ -type f -regex .\\*/.\\*\\\\.sh").stdout.split
    describe files.delete_if { |f| command("file #{f} | cut -d: -f2").stdout =~ /binary|executable|archive/ || file(f).content !~ /^\s*umask\s+[01234567][2367]7\s*(\s+#.*)?$/ } do
      it { should_not be_empty }
    end
  end
  describe file("/etc/profile") do
    its("content") { should match(/^\s*umask\s+[01234567][2367]7\s*(\s+#.*)?$/) }
  end
  files = command("find /etc/profile.d/ -type f -regex .\\*/.\\*\\\\.sh").stdout.split
  describe files.delete_if { |f| command("file #{f} | cut -d: -f2").stdout =~ /binary|executable|archive/ || file(f).content !~ /^\s*umask\s+[01234567](0[7654321]|[7654321][654321])\s*(\s+#.*)?$/ } do
    it { should be_empty }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_5.6_Ensure_root_login_is_restricted_to_system_console" do
  title "Ensure root login is restricted to system console"
  desc  "
    The file /etc/securetty contains a list of valid terminals that may be logged in directly as root.
    
    Rationale: Since the system console has special properties to handle emergency situations, it is important to ensure that the console is in a physically secure location and that unauthorized consoles have not been defined.
  "
  impact 0.0
  describe "No tests defined for this control" do
    skip "No tests defined for this control"
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_5.7_Ensure_access_to_the_su_command_is_restricted" do
  title "Ensure access to the su command is restricted"
  desc  "
    The su command allows a user to run a command or shell as another user. The program has been superseded by sudo , which allows for more granular control over privileged access. Normally, the su command can be executed by any user. By uncommenting the pam_wheel.so statement in /etc/pam.d/su , the su command will only allow users in the wheel group to execute su .
    
    Rationale: Restricting the use of su , and using sudo in its place, provides system administrators better control of the escalation of user privileges to execute privileged commands. The sudo utility also provides a better logging and audit mechanism, as it can log each command executed via sudo , whereas su can only record that a user executed the su program.
  "
  impact 1.0
  describe file("/etc/pam.d/su") do
    its("content") { should match(/^\s*auth\s+required\s+pam_wheel.so(\s+\S+)*\s+use_uid(\s+\S+)*\s*(\s+#.*)?$/) }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_6.1.2_Ensure_permissions_on_etcpasswd_are_configured" do
  title "Ensure permissions on /etc/passwd are configured"
  desc  "
    The /etc/passwd file contains user account information that is used by many system utilities and therefore must be readable for these utilities to operate.
    
    Rationale: It is critical to ensure that the /etc/passwd file is protected from unauthorized write access. Although it is protected by default, the file permissions could be changed either inadvertently or through malicious actions.
  "
  impact 1.0
  describe file("/etc/passwd") do
    it { should exist }
  end
  describe file("/etc/passwd") do
    it { should_not be_executable.by "group" }
  end
  describe file("/etc/passwd") do
    its("gid") { should cmp 0 }
  end
  describe file("/etc/passwd") do
    it { should_not be_writable.by "group" }
  end
  describe file("/etc/passwd") do
    it { should_not be_executable.by "other" }
  end
  describe file("/etc/passwd") do
    it { should_not be_writable.by "other" }
  end
  describe file("/etc/passwd") do
    it { should_not be_executable.by "owner" }
  end
  describe file("/etc/passwd") do
    its("uid") { should cmp 0 }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_6.1.3_Ensure_permissions_on_etcpasswd-_are_configured" do
  title "Ensure permissions on /etc/passwd- are configured"
  desc  "
    The /etc/passwd- file contains backup user account information.
    
    Rationale: It is critical to ensure that the /etc/passwd- file is protected from unauthorized access. Although it is protected by default, the file permissions could be changed either inadvertently or through malicious actions.
  "
  impact 1.0
  describe file("/etc/passwd-") do
    it { should exist }
  end
  describe file("/etc/passwd-") do
    it { should_not be_executable.by "group" }
  end
  describe file("/etc/passwd-") do
    its("gid") { should cmp 0 }
  end
  describe file("/etc/passwd-") do
    it { should_not be_writable.by "group" }
  end
  describe file("/etc/passwd-") do
    it { should_not be_executable.by "other" }
  end
  describe file("/etc/passwd-") do
    it { should_not be_writable.by "other" }
  end
  describe file("/etc/passwd-") do
    it { should_not be_executable.by "owner" }
  end
  describe file("/etc/passwd-") do
    its("uid") { should cmp 0 }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_6.1.4_Ensure_permissions_on_etcshadow_are_configured" do
  title "Ensure permissions on /etc/shadow are configured"
  desc  "
    The /etc/shadow file is used to store the information about user accounts that is critical to the security of those accounts, such as the hashed password and other security information.
    
    Rationale: If attackers can gain read access to the /etc/shadow file, they can easily run a password cracking program against the hashed password to break it. Other security information that is stored in the /etc/shadow file (such as expiration) could also be useful to subvert the user accounts.
  "
  impact 1.0
  describe file("/etc/shadow") do
    it { should exist }
  end
  describe file("/etc/shadow") do
    it { should_not be_executable.by "group" }
  end
  describe file("/etc/shadow") do
    it { should_not be_readable.by "group" }
  end
  describe file("/etc/shadow") do
    its("gid") { should cmp 0 }
  end
  describe file("/etc/shadow") do
    it { should_not be_writable.by "group" }
  end
  describe file("/etc/shadow") do
    it { should_not be_executable.by "other" }
  end
  describe file("/etc/shadow") do
    it { should_not be_readable.by "other" }
  end
  describe file("/etc/shadow") do
    it { should_not be_writable.by "other" }
  end
  describe file("/etc/shadow") do
    it { should_not be_executable.by "owner" }
  end
  describe file("/etc/shadow") do
    it { should_not be_readable.by "owner" }
  end
  describe file("/etc/shadow") do
    its("uid") { should cmp 0 }
  end
  describe file("/etc/shadow") do
    it { should_not be_writable.by "owner" }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_6.1.5_Ensure_permissions_on_etcshadow-_are_configured" do
  title "Ensure permissions on /etc/shadow- are configured"
  desc  "
    The /etc/shadow- file is used to store backup information about user accounts that is critical to the security of those accounts, such as the hashed password and other security information.
    
    Rationale: It is critical to ensure that the /etc/shadow- file is protected from unauthorized access. Although it is protected by default, the file permissions could be changed either inadvertently or through malicious actions.
  "
  impact 1.0
  describe file("/etc/shadow-") do
    it { should exist }
  end
  describe file("/etc/shadow-") do
    it { should_not be_executable.by "group" }
  end
  describe file("/etc/shadow-") do
    it { should_not be_readable.by "group" }
  end
  describe file("/etc/shadow-") do
    its("gid") { should cmp 0 }
  end
  describe file("/etc/shadow-") do
    it { should_not be_writable.by "group" }
  end
  describe file("/etc/shadow-") do
    it { should_not be_executable.by "other" }
  end
  describe file("/etc/shadow-") do
    it { should_not be_readable.by "other" }
  end
  describe file("/etc/shadow-") do
    it { should_not be_writable.by "other" }
  end
  describe file("/etc/shadow-") do
    it { should_not be_executable.by "owner" }
  end
  describe file("/etc/shadow-") do
    it { should_not be_readable.by "owner" }
  end
  describe file("/etc/shadow-") do
    its("uid") { should cmp 0 }
  end
  describe file("/etc/shadow-") do
    it { should_not be_writable.by "owner" }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_6.1.6_Ensure_permissions_on_etcgshadow_are_configured" do
  title "Ensure permissions on /etc/gshadow are configured"
  desc  "
    The /etc/gshadow file is used to store the information about groups that is critical to the security of those accounts, such as the hashed password and other security information.
    
    Rationale: If attackers can gain read access to the /etc/gshadow file, they can easily run a password cracking program against the hashed password to break it. Other security information that is stored in the /etc/gshadow file (such as group administrators) could also be useful to subvert the group.
  "
  impact 1.0
  describe file("/etc/gshadow") do
    it { should exist }
  end
  describe file("/etc/gshadow") do
    it { should_not be_executable.by "group" }
  end
  describe file("/etc/gshadow") do
    it { should_not be_readable.by "group" }
  end
  describe file("/etc/gshadow") do
    its("gid") { should cmp 0 }
  end
  describe file("/etc/gshadow") do
    it { should_not be_writable.by "group" }
  end
  describe file("/etc/gshadow") do
    it { should_not be_executable.by "other" }
  end
  describe file("/etc/gshadow") do
    it { should_not be_readable.by "other" }
  end
  describe file("/etc/gshadow") do
    it { should_not be_writable.by "other" }
  end
  describe file("/etc/gshadow") do
    it { should_not be_executable.by "owner" }
  end
  describe file("/etc/gshadow") do
    it { should_not be_readable.by "owner" }
  end
  describe file("/etc/gshadow") do
    its("uid") { should cmp 0 }
  end
  describe file("/etc/gshadow") do
    it { should_not be_writable.by "owner" }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_6.1.7_Ensure_permissions_on_etcgshadow-_are_configured" do
  title "Ensure permissions on /etc/gshadow- are configured"
  desc  "
    The /etc/gshadow- file is used to store backup information about groups that is critical to the security of those accounts, such as the hashed password and other security information.
    
    Rationale: It is critical to ensure that the /etc/gshadow- file is protected from unauthorized access. Although it is protected by default, the file permissions could be changed either inadvertently or through malicious actions.
  "
  impact 1.0
  describe file("/etc/gshadow-") do
    it { should exist }
  end
  describe file("/etc/gshadow-") do
    it { should_not be_executable.by "group" }
  end
  describe file("/etc/gshadow-") do
    it { should_not be_readable.by "group" }
  end
  describe file("/etc/gshadow-") do
    its("gid") { should cmp 0 }
  end
  describe file("/etc/gshadow-") do
    it { should_not be_writable.by "group" }
  end
  describe file("/etc/gshadow-") do
    it { should_not be_executable.by "other" }
  end
  describe file("/etc/gshadow-") do
    it { should_not be_readable.by "other" }
  end
  describe file("/etc/gshadow-") do
    it { should_not be_writable.by "other" }
  end
  describe file("/etc/gshadow-") do
    it { should_not be_executable.by "owner" }
  end
  describe file("/etc/gshadow-") do
    it { should_not be_readable.by "owner" }
  end
  describe file("/etc/gshadow-") do
    its("uid") { should cmp 0 }
  end
  describe file("/etc/gshadow-") do
    it { should_not be_writable.by "owner" }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_6.1.8_Ensure_permissions_on_etcgroup_are_configured" do
  title "Ensure permissions on /etc/group are configured"
  desc  "
    The /etc/group file contains a list of all the valid groups defined in the system. The command below allows read/write access for root and read access for everyone else.
    
    Rationale: The /etc/group file needs to be protected from unauthorized changes by non-privileged users, but needs to be readable as this information is used with many non-privileged programs.
  "
  impact 1.0
  describe file("/etc/group") do
    it { should exist }
  end
  describe file("/etc/group") do
    it { should_not be_executable.by "group" }
  end
  describe file("/etc/group") do
    its("gid") { should cmp 0 }
  end
  describe file("/etc/group") do
    it { should_not be_writable.by "group" }
  end
  describe file("/etc/group") do
    it { should_not be_executable.by "other" }
  end
  describe file("/etc/group") do
    it { should_not be_writable.by "other" }
  end
  describe file("/etc/group") do
    it { should_not be_executable.by "owner" }
  end
  describe file("/etc/group") do
    its("uid") { should cmp 0 }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_6.1.9_Ensure_permissions_on_etcgroup-_are_configured" do
  title "Ensure permissions on /etc/group- are configured"
  desc  "
    The /etc/group- file contains a backup list of all the valid groups defined in the system.
    
    Rationale: It is critical to ensure that the /etc/group- file is protected from unauthorized access. Although it is protected by default, the file permissions could be changed either inadvertently or through malicious actions.
  "
  impact 1.0
  describe file("/etc/group-") do
    it { should exist }
  end
  describe file("/etc/group-") do
    it { should_not be_executable.by "group" }
  end
  describe file("/etc/group-") do
    its("gid") { should cmp 0 }
  end
  describe file("/etc/group-") do
    it { should_not be_writable.by "group" }
  end
  describe file("/etc/group-") do
    it { should_not be_executable.by "other" }
  end
  describe file("/etc/group-") do
    it { should_not be_writable.by "other" }
  end
  describe file("/etc/group-") do
    it { should_not be_executable.by "owner" }
  end
  describe file("/etc/group-") do
    its("uid") { should cmp 0 }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_6.1.10_Ensure_no_world_writable_files_exist" do
  title "Ensure no world writable files exist"
  desc  "
    Unix-based systems support variable settings to control access to files. World writable files are the least secure. See the chmod(2) man page for more information.
    
    Rationale: Data in world-writable files can be modified and compromised by any user on the system. World writable files may also indicate an incorrectly written script or program that could potentially be the cause of a larger compromise to the system's integrity.
  "
  impact 1.0
  world_writeable_files = command('df --local -P | awk {\'if (NR!=1) print $6\'} | xargs -I \'{}\' find \'{}\' -xdev -perm -0002 -type f ! -path \'/proc/*\' ! -path \'/sys/*\' -print 2>/dev/null').stdout.split(/\r?\n/)
  describe world_writeable_files do
    it { should be_empty }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_6.1.11_Ensure_no_unowned_files_or_directories_exist" do
  title "Ensure no unowned files or directories exist"
  desc  "
    Sometimes when administrators delete users from the password file they neglect to remove all files owned by those users from the system.
    
    Rationale: A new user who is assigned the deleted user's user ID or group ID may then end up \"owning\" these files, and thus have more access on the system than was intended.
  "
  impact 1.0
  file_no_user = command('df --local -P | awk {\'if (NR!=1) print $6\'} | xargs -I \'{}\' find \'{}\' -xdev -nouser').stdout.split(/\r?\n/)
  describe file_no_user do
    it { should be_empty }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_6.1.12_Ensure_no_ungrouped_files_or_directories_exist" do
  title "Ensure no ungrouped files or directories exist"
  desc  "
    Sometimes when administrators delete users or groups from the system they neglect to remove all files owned by those users or groups.
    
    Rationale: A new user who is assigned the deleted user's user ID or group ID may then end up \"owning\" these files, and thus have more access on the system than was intended.
  "
  impact 1.0
  file_no_group = command('df --local -P | awk {\'if (NR!=1) print $6\'} | xargs -I \'{}\' find \'{}\' -xdev -nogroup').stdout.split(/\r?\n/)
  describe file_no_group do
    it { should be_empty }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_6.1.13_Audit_SUID_executables" do
  title "Audit SUID executables"
  desc  "
    The owner of a file can set the file's permissions to run with the owner's or group's permissions, even if the user running the program is not the owner or a member of the group. The most common reason for a SUID program is to enable users to perform functions (such as changing their password) that require root privileges.
    
    Rationale: There are valid reasons for SUID programs, but it is important to identify and review such programs to ensure they are legitimate.
  "
  impact 0.0
  describe "No tests defined for this control" do
    skip "No tests defined for this control"
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_6.1.14_Audit_SGID_executables" do
  title "Audit SGID executables"
  desc  "
    The owner of a file can set the file's permissions to run with the owner's or group's permissions, even if the user running the program is not the owner or a member of the group. The most common reason for a SGID program is to enable users to perform functions (such as changing their password) that require root privileges.
    
    Rationale: There are valid reasons for SGID programs, but it is important to identify and review such programs to ensure they are legitimate. Review the files returned by the action in the audit section and check to see if system binaries have a different md5 checksum than what from the package. This is an indication that the binary may have been replaced.
  "
  impact 0.0
  describe "No tests defined for this control" do
    skip "No tests defined for this control"
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_6.2.1_Ensure_password_fields_are_not_empty" do
  title "Ensure password fields are not empty"
  desc  "
    An account with an empty password field means that anybody may log in as that user without providing a password.
    
    Rationale: All accounts must have passwords or be locked to prevent the account from being used by an unauthorized user.
  "
  impact 1.0
  describe shadow.where { user =~ /.+/ and password !~ /.+/ } do
    its("raw_data") { should be_empty }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_6.2.2_Ensure_no_legacy__entries_exist_in_etcpasswd" do
  title "Ensure no legacy \"+\" entries exist in /etc/passwd"
  desc  "
    The character + in various files used to be markers for systems to insert data from NIS maps at a certain point in a system configuration file. These entries are no longer required on most systems, but may exist in files that have been imported from other platforms.
    
    Rationale: These entries may provide an avenue for attackers to gain privileged access on the system.
  "
  impact 1.0
  describe file("/etc/passwd") do
    its("content") { should_not match(/^\+[^:\n\r]*:.*$/) }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_6.2.3_Ensure_root_PATH_Integrity" do
  title "Ensure root PATH Integrity"
  desc  "
    The root user can execute any command on the system and could be fooled into executing programs unintentionally if the PATH is not set correctly.
    
    Rationale: Including the current working directory (.) or other writable directory in root 's executable path makes it likely that an attacker can gain superuser access by forcing an administrator operating as root to execute a Trojan horse program.
  "
  impact 1.0
  only_if { bash('id').stdout =~ /uid\=0\(root\)/ }
  describe os_env('PATH').content.to_s.split(':') do
    it { should_not be_empty }
  end
  os_env('PATH').content.to_s.split(':').each do |entry|
    describe entry do
      it { should_not eq "" }
      it { should_not eq "." }
    end
  end
  os_env('PATH').content.to_s.split(':').each do |entry|
    describe file(entry) do
      it { should exist }
      it { should_not be_writable.by 'group' }
      it { should_not be_writable.by 'other' }
      its( 'uid' ) { should cmp 0 }
    end
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_6.2.4_Ensure_no_legacy__entries_exist_in_etcshadow" do
  title "Ensure no legacy \"+\" entries exist in /etc/shadow"
  desc  "
    The character + in various files used to be markers for systems to insert data from NIS maps at a certain point in a system configuration file. These entries are no longer required on most systems, but may exist in files that have been imported from other platforms.
    
    Rationale: These entries may provide an avenue for attackers to gain privileged access on the system.
  "
  impact 1.0
  describe file("/etc/shadow") do
    its("content") { should_not match(/^\+[^:\n\r]*:.*$/) }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_6.2.5_Ensure_no_legacy__entries_exist_in_etcgroup" do
  title "Ensure no legacy \"+\" entries exist in /etc/group"
  desc  "
    The character + in various files used to be markers for systems to insert data from NIS maps at a certain point in a system configuration file. These entries are no longer required on most systems, but may exist in files that have been imported from other platforms.
    
    Rationale: These entries may provide an avenue for attackers to gain privileged access on the system.
  "
  impact 1.0
  describe file("/etc/group") do
    its("content") { should_not match(/^\+[^:\n\r]*:.*$/) }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_6.2.6_Ensure_root_is_the_only_UID_0_account" do
  title "Ensure root is the only UID 0 account"
  desc  "
    Any account with UID 0 has superuser privileges on the system.
    
    Rationale: This access must be limited to only the default root account and only from the system console. Administrative access must be through an unprivileged account using an approved mechanism as noted in recommendation \"Ensure access to the su command is restricted\".
  "
  impact 1.0
  describe file("/etc/passwd") do
    its("content") { should_not match(/^(?!root:)[^:]*:[^:]*:0/) }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_6.2.7_Ensure_users_home_directories_permissions_are_750_or_more_restrictive" do
  title "Ensure users' home directories permissions are 750 or more restrictive"
  desc  "
    While the system administrator can establish secure permissions for users' home directories, the users can easily override these.
    
    Rationale: Group or world-writable user home directories may enable malicious users to steal or modify other users' data or to gain another user's system privileges.
  "
  impact 1.0
  passwd.where { user =~ /^(?!root|halt|sync|shutdown).*/ }.where { shell != '/sbin/nologin' }.where{ shell != '/usr/bin/nologin' }.where{ shell != '/bin/nologin' }.where{ shell != '/bin/false' }.homes.each do |homefolder|
    describe file(homefolder) do
      it { should exist }
      it { should be_directory }
      it { should be_executable.by('owner') }
      it { should_not be_executable.by('other') }
      it { should be_writable.by('owner') }
      it { should_not be_writable.by('group') }
      it { should_not be_writable.by('other') }
      it { should be_readable.by('owner') }
      it { should_not be_readable.by('other') }
    end
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_6.2.8_Ensure_users_own_their_home_directories" do
  title "Ensure users own their home directories"
  desc  "
    The user home directory is space defined for the particular user to set local environment variables and to store personal files.
    
    Rationale: Since the user is accountable for files stored in the user home directory, the user must be the owner of the directory.
  "
  impact 1.0
  homeslist = {}
  nologin = [ '/sbin/nologin', '/usr/bin/nologin', '/bin/nologin', '/bin/false' ]
  passwd.where { user =~ /^(?!root|halt|sync|shutdown).*/ }.where { ! nologin.include?(shell) }.users.each_with_index { |k,i| homeslist[k] = passwd.where { user =~ /^(?!root|halt|sync|shutdown).*/ }.where { ! nologin.include?(shell) }.homes[i] }
  homeslist.each do |user,homefolder|
    describe file(homefolder) do
      it { should exist }
      it { should be_directory }
      it { should be_owned_by user }
    end
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_6.2.9_Ensure_users_dot_files_are_not_group_or_world_writable" do
  title "Ensure users' dot files are not group or world writable"
  desc  "
    While the system administrator can establish secure permissions for users' \"dot\" files, the users can easily override these.
    
    Rationale: Group or world-writable user configuration files may enable malicious users to steal or modify other users' data or to gain another user's system privileges.
  "
  impact 1.0
  homeslist = {}
  nologin = [ '/sbin/nologin', '/usr/bin/nologin', '/bin/nologin', '/bin/false' ]
  passwd.where { user =~ /^(?!root|halt|sync|shutdown).*/ }.where { ! nologin.include?(shell) }.users.each_with_index { |k,i| homeslist[k] = passwd.where { user =~ /^(?!root|halt|sync|shutdown).*/ }.where { ! nologin.include?(shell) }.homes[i] }
  if homeslist.any?
    homeslist.each do |user,homefolder|
      dotfiles = command('ls -d ' + homefolder + '/.[A-Za-z0-9]*').stdout.split
      if !dotfiles.empty?
        dotfiles.each do |dotfile|
          if file(dotfile).exist?
            describe file(dotfile) do
              it { should exist }
              it { should be_owned_by user }
              it { should_not be_writable.by('group') }
              it { should_not be_writable.by('other') }
            end
          end
        end
      else
        describe dotfiles do
          it { should be_empty }
        end
      end
    end
  else
    describe homeslist do
      it { should be_empty }
    end
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_6.2.10_Ensure_no_users_have_.forward_files" do
  title "Ensure no users have .forward files"
  desc  "
    The .forward file specifies an email address to forward the user's mail to.
    
    Rationale: Use of the .forward file poses a security risk in that sensitive data may be inadvertently transferred outside the organization. The .forward file also poses a risk as it can be used to execute commands that may perform unintended actions.
  "
  impact 1.0
  homeslist = {}
  passwd.where { user =~ /^(?!root|halt|sync|shutdown).*/ }.where { shell != '/sbin/nologin' }.where{ shell != '/usr/bin/nologin' }.where{ shell != '/bin/nologin' }.where{ shell != '/bin/false' }.raw_data.each {|u| homeslist[u["user"]] = u["home"] }
  if homeslist.any?
    homeslist.each do |user,homefolder|
      describe file(homefolder + '/.forward') do
        it { should_not exist }
      end
      hostbasedforwardfile = command('ls ' + homefolder + '/.forward.*').stdout.split
      if ! hostbasedforwardfile.empty?
        hostbasedforwardfile.each do |forwardfile|
          describe file(forwardfile) do
            it { should_not exist }
          end
        end
      else
        describe file(homefolder + '/.forward.example.com') do
          it { should_not exist }
        end
      end
      describe file(homefolder + '/.forward+') do
        it { should_not exist }
      end
    end
  else
    describe homeslist do
      it { should be_empty }
    end
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_6.2.11_Ensure_no_users_have_.netrc_files" do
  title "Ensure no users have .netrc files"
  desc  "
    The .netrc file contains data for logging into a remote host for file transfers via FTP.
    
    Rationale: The .netrc file presents a significant security risk since it stores passwords in unencrypted form. Even if FTP is disabled, user accounts may have brought over .netrc files from other systems which could pose a risk to those systems.
  "
  impact 1.0
  homeslist = {}
  passwd.where { user =~ /^(?!root|halt|sync|shutdown).*/ }.where { ! %w{ /sbin/nologin /usr/bin/nologin /bin/nologin /bin/false}.include?(shell) }.users.each_with_index {|k,i| homeslist[k] = passwd.where{ ! %w{ /sbin/nologin /usr/bin/nologin /bin/nologin /bin/false}.include?(shell) }.homes[i] }
  if homeslist.any?
    homeslist.each do |user,homefolder|
      describe file(homefolder + '/.netrc') do
        it { should_not exist }
      end
    end
  else
    describe homeslist do
      it { should be_empty }
    end
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_6.2.12_Ensure_users_.netrc_Files_are_not_group_or_world_accessible" do
  title "Ensure users' .netrc Files are not group or world accessible"
  desc  "
    While the system administrator can establish secure permissions for users' .netrc files, the users can easily override these.
    
    Rationale: The .netrc file presents a significant security risk since it stores passwords in unencrypted form. Even if FTP is disabled, user accounts may have brought over .netrc files from other systems which could pose a risk to those systems.
    
    If a .netrc file is required, and follows local site policy, it should have permissions of 600 or more restrictive.
  "
  impact 1.0
  homeslist = {}
  passwd.where { user =~ /^(?!root|halt|sync|shutdown).*/ }.where { shell != '/sbin/nologin' }.where{ shell != '/usr/bin/nologin' }.where{ shell != '/bin/nologin' }.where{ shell != '/bin/false' }.raw_data.each {|u| homeslist[u["user"]] = u["home"] }
  if homeslist.any?
    homeslist.each do |user,homefolder|
      if file(homefolder + '/.netrc').exist?
        describe file(homefolder + '/.netrc') do
          it { should be_owned_by user }
          it { should be_writable.by('owner') }
          it { should_not be_writable.by('group') }
          it { should_not be_writable.by('other') }
          it { should be_readable.by('owner') }
          it { should_not be_readable.by('group') }
          it { should_not be_readable.by('other') }
          it { should be_executable.by('owner') }
          it { should_not be_executable.by('group') }
          it { should_not be_executable.by('other') }
        end
      else
        describe file(homefolder + '/.netrc') do
          it { should_not exist }
        end
      end
    end
  else
    describe homeslist do
      it { should be_empty }
    end
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_6.2.13_Ensure_no_users_have_.rhosts_files" do
  title "Ensure no users have .rhosts files"
  desc  "
    While no .rhosts files are shipped by default, users can easily create them.
    
    Rationale: This action is only meaningful if .rhosts support is permitted in the file /etc/pam.conf . Even though the .rhosts files are ineffective if support is disabled in /etc/pam.conf , they may have been brought over from other systems and could contain information useful to an attacker for those other systems.
  "
  impact 1.0
  homeslist = {}
  passwd.where { user =~ /^(?!root|halt|sync|shutdown).*/ }.where { shell != '/sbin/nologin' }.where{ shell != '/usr/bin/nologin' }.where{ shell != '/bin/nologin' }.where{ shell != '/bin/false' }.raw_data.each {|u| homeslist[u["user"]] = u["home"] }
  if homeslist.any?
    homeslist.each do |user,homefolder|
      describe file(homefolder + '/.rhosts') do
        it { should_not exist }
      end
    end
  else
    describe homeslist do
      it { should be_empty }
    end
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_6.2.14_Ensure_all_groups_in_etcpasswd_exist_in_etcgroup" do
  title "Ensure all groups in /etc/passwd exist in /etc/group"
  desc  "
    Over time, system administration errors and changes can lead to groups being defined in /etc/passwd but not in /etc/group .
    
    Rationale: Groups defined in the /etc/passwd file but not in the /etc/group file pose a threat to system security since group permissions are not properly managed.
  "
  impact 1.0
  groupslist = {}
  passwd.uids.each_with_index {|k,i| groupslist[k] = passwd.gids[i] }
  if groupslist.any?
    groupslist.each do |uid,gid|
      describe etc_group do
        its('gids') { should include gid.to_i }
      end
    end
  else
    describe groupslist do
      it { should be_empty }
    end
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_6.2.15_Ensure_no_duplicate_UIDs_exist" do
  title "Ensure no duplicate UIDs exist"
  desc  "
    Although the useradd program will not let you create a duplicate User ID (UID), it is possible for an administrator to manually edit the /etc/passwd file and change the UID field.
    
    Rationale: Users must be assigned unique UIDs for accountability and to ensure appropriate access protections.
  "
  impact 1.0
  describe passwd.where { user =~ /.*/ }.uids do
    its("length") { should_not eq 0 }
  end
  a = passwd.where { user =~ /.*/ }.uids.uniq.length
  describe passwd.where { user =~ /.*/ }.uids do
    its("length") { should cmp == a }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_6.2.16_Ensure_no_duplicate_GIDs_exist" do
  title "Ensure no duplicate GIDs exist"
  desc  "
    Although the groupadd program will not let you create a duplicate Group ID (GID), it is possible for an administrator to manually edit the /etc/group file and change the GID field.
    
    Rationale: User groups must be assigned unique GIDs for accountability and to ensure appropriate access protections.
  "
  impact 1.0
  describe file("/etc/group").content.to_s.scan(/^[^:]+:[^:]+:([\d]+):[^:]*$/).flatten do
    its("length") { should_not eq 0 }
  end
  a = file("/etc/group").content.to_s.scan(/^[^:]+:[^:]+:([\d]+):[^:]*$/).flatten.uniq.length
  describe file("/etc/group").content.to_s.scan(/^[^:]+:[^:]+:([\d]+):[^:]*$/).flatten do
    its("length") { should cmp == a }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_6.2.17_Ensure_no_duplicate_user_names_exist" do
  title "Ensure no duplicate user names exist"
  desc  "
    Although the useradd program will not let you create a duplicate user name, it is possible for an administrator to manually edit the /etc/passwd file and change the user name.
    
    Rationale: If a user is assigned a duplicate user name, it will create and have access to files with the first UID for that username in /etc/passwd . For example, if \"test4\" has a UID of 1000 and a subsequent \"test4\" entry has a UID of 2000, logging in as \"test4\" will use UID 1000. Effectively, the UID is shared, which is a security problem.
  "
  impact 1.0
  describe file("/etc/passwd").content.to_s.scan(/^([^:]+):[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*$/).flatten do
    its("length") { should_not eq 0 }
  end
  a = file("/etc/passwd").content.to_s.scan(/^([^:]+):[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*$/).flatten.uniq.length
  describe file("/etc/passwd").content.to_s.scan(/^([^:]+):[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*$/).flatten do
    its("length") { should cmp == a }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_6.2.18_Ensure_no_duplicate_group_names_exist" do
  title "Ensure no duplicate group names exist"
  desc  "
    Although the groupadd program will not let you create a duplicate group name, it is possible for an administrator to manually edit the /etc/group file and change the group name.
    
    Rationale: If a group is assigned a duplicate group name, it will create and have access to files with the first GID for that group in /etc/group . Effectively, the GID is shared, which is a security problem.
  "
  impact 1.0
  describe file("/etc/group").content.to_s.scan(/^([^:]+):[^:]+:[\d]+:[^:]*$/).flatten do
    its("length") { should_not eq 0 }
  end
  a = file("/etc/group").content.to_s.scan(/^([^:]+):[^:]+:[\d]+:[^:]*$/).flatten.uniq.length
  describe file("/etc/group").content.to_s.scan(/^([^:]+):[^:]+:[\d]+:[^:]*$/).flatten do
    its("length") { should cmp == a }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_6.2.19_Ensure_shadow_group_is_empty" do
  title "Ensure shadow group is empty"
  desc  "
    The shadow group allows system programs which require access the ability to read the /etc/shadow file. No users should be assigned to the shadow group.
    
    Rationale: Any users assigned to the shadow group would be granted read access to the /etc/shadow file. If attackers can gain read access to the /etc/shadow file, they can easily run a password cracking program against the hashed passwords to break them. Other security information that is stored in the /etc/shadow file (such as expiration) could also be useful to subvert additional user accounts.
  "
  impact 1.0
  describe file("/etc/group") do
    its("content") { should_not match(/^shadow:[^:]*:[^:]*:[^:]+$/) }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_6.2.20_Ensure_all_users_home_directories_exist" do
  title "Ensure all users' home directories exist"
  desc  "
    Users can be defined in /etc/passwd without a home directory or with a home directory that does not actually exist.
    
    Rationale: If the user's home directory does not exist or is unassigned, the user will be placed in \"/\" and will not be able to write any files or have local environment variables set.
  "
  impact 1.0
  passwd.where { user =~ /^(?!root|halt|sync|shutdown).*/ }.where { shell != '/sbin/nologin' }.where{ shell != '/usr/bin/nologin' }.where{ shell != '/bin/nologin' }.where{ shell != '/bin/false' }.homes.each do |homefolder|
    describe file(homefolder) do
      it {should exist }
      it {should be_directory }
    end
  end
end