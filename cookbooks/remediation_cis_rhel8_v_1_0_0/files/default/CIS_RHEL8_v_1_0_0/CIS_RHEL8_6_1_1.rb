# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_6_1_1 < CISRemediation
  def initialize
    super('CIS_RHEL8_6_1_1')
    @title = 'Audit system file permissions (Not Scored)'
    @scored = false
    @level = 2
    @identifier = '6.1.1'
    @description = '
    "6.1.1 Audit system file permissions (Not Scored)\nProfile Applicability:\n Level 2 - Server\n Level 2 - Workstation Description:\nThe RPM package manager has a number of useful options. One of these, the -V for RPM option, can be used to verify that system packages are correctly installed. The -V option can be used to verify a particular \npackage or to verify all system packages. If no output is returned, the package is installed correctly. The following table describes the meaning of output from the verify option:\n      Code Meaning\nS File size differs.\nM File mode differs (includes permissions and file type).\n5 The MD5 checksum differs.\nD The major and minor version numbers differ on a device file. L A mismatch occurs in a link.\nU The file ownership differs.\nG The file group owner differs.\nT The file time (mtime) differs.\n                   The rpm -qf command can be used to determine which package a particular file belongs to. For example the following commands determines which package the /bin/bash file belongs to:\n      # rpm -qf /bin/bash\nbash-4.1.2-29.el6.x86_64\n# dpkg -S /bin/bash\nbash: /bin/bash\n\nTo verify the settings for the package that controls the /bin/bash file, run the following:\nNote that you can feed the output of the rpm -qf command to the rpm -V command:\nRationale:\nIt is important to confirm that packaged system files and directories are maintained with the permissions they were intended to have from the OS vendor.\nAudit:\nRun the following command to review all installed packages. Note that this may be very time consuming and may be best scheduled via the cron utility. It is recommended that the output of this command be redirected to \na file that can be reviewed later.\n# rpm -Va --nomtime --nosize --nomd5 --nolinkto > <filename>\n      # rpm -V bash-4.1.2-29.el6.x86_64\n.M.......    /bin/bash\n# dpkg --verify bash\n??5?????? c /etc/bash.bashrc\n               # rpm -V `rpm -qf /etc/passwd`\n   .M...... c /etc/passwd\nS.5....T c /etc/printcap\n\nRemediation:\nCorrect any discrepancies found and rerun the audit until output is clean or risk is mitigated or accepted.\nReferences:\n1. http://docs.fedoraproject.org/en- US/Fedora_Draft_Documentation/0.1/html/RPM_Guide/index.html\nNotes:\nSince packages and important files may change with new updates and releases, it is recommended to verify everything, not just a finite list of files. This can be a time consuming task and results may depend on site \npolicy therefore it is not a scorable benchmark item, but is provided for those interested in additional security measures.\nSome of the recommendations of this benchmark alter the state of files audited by this recommendation. The audit command will alert for all changes to a file permissions even if the new state is more secure than the \ndefault.\nCIS Controls:\nVersion 7\n14.6 Protect Information through Access Control Lists\nProtect all information stored on systems with file system, network share, claims, application, or database specific access control lists. These controls will enforce the principle that only authorized individuals \nshould have access to the information based on their need to access the information as a part of their responsibilities.\n\n"
    '
    @script_file = ''
    @commands = [{"local"=>"echo 'Automated remediation unavailable. Please remediate manually:\n\nCorrect any discrepancies found and rerun the audit until output is clean or risk is mitigated or accepted.'\n"}]
  end
end