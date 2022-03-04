resource "aws_instance" "chef_clients_windows" {
  count                       = "${length(var.windows_hostnames)}"
  ami                         = data.aws_ami.windows-2019.id
  instance_type               = var.windows_instance_type
  key_name                    = var.aws_key_pair_name
  availability_zone           = "${var.aws_region}b"
  subnet_id                   = aws_subnet.chef-subnet-b.id
  vpc_security_group_ids      = [aws_security_group.chef_clients.id]
  associate_public_ip_address = true
  ebs_optimized               = true
  user_data                   = <<EOF
<powershell>

write-output "Running User Data Script"
write-host "(Host) Running User Data Script"

# create a C:/chef folder
New-Item -Path "c:\" -Name "chef" -ItemType "directory"

# set administrator password
cmd.exe /c net user Administrator ${var.windows_password}
cmd.exe /c net user chef ${var.windows_password} /add /LOGONPASSWORDCHG:NO
cmd.exe /c net localgroup Administrators /add chef

# RDP
cmd.exe /c netsh advfirewall firewall add rule name="Open Port 3389" dir=in action=allow protocol=TCP localport=3389
cmd.exe /c reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f

# WinRM
write-output "Setting up WinRM"
write-host "(Host) Setting up WinRM"

cmd.exe /c winrm quickconfig -q
cmd.exe /c winrm quickconfig '-transport:http'
cmd.exe /c winrm quickconfig '-transport:https'
cmd.exe /c winrm set "winrm/config" '@{MaxTimeoutms="1800000"}'
cmd.exe /c winrm set "winrm/config/winrs" '@{MaxMemoryPerShellMB="3072"}'
cmd.exe /c winrm set "winrm/config/service" '@{AllowUnencrypted="true"}'
cmd.exe /c winrm set "winrm/config/client" '@{AllowUnencrypted="true"}'
cmd.exe /c winrm set "winrm/config/service/auth" '@{Basic="true"}'
cmd.exe /c winrm set "winrm/config/client/auth" '@{Basic="true"}'
cmd.exe /c winrm set "winrm/config/service/auth" '@{CredSSP="true"}'
cmd.exe /c winrm set "winrm/config/listener?Address=*+Transport=HTTP" '@{Port="5985"}'
cmd.exe /c winrm set "winrm/config/listener?Address=*+Transport=HTTPS" '@{Port="5986"}'
cmd.exe /c netsh advfirewall firewall set rule group="remote administration" new enable=yes
cmd.exe /c netsh advfirewall firewall add rule name="WinRM 5985" protocol=TCP dir=in localport=5985 action=allow
cmd.exe /c netsh advfirewall firewall add rule name="WinRM 5985" protocol=TCP dir=out localport=5985 action=allow
cmd.exe /c netsh advfirewall firewall add rule name="WinRM 5986" protocol=TCP dir=in localport=5986 action=allow
cmd.exe /c netsh advfirewall firewall add rule name="WinRM 5986" protocol=TCP dir=out localport=5986 action=allow
cmd.exe /c net stop winrm
cmd.exe /c sc config winrm start= auto
cmd.exe /c net start winrm
cmd.exe /c wmic useraccount where "name='Administrator'" set PasswordExpires=FALSE
cmd.exe /c wmic useraccount where "name='chef'" set PasswordExpires=FALSE

set-executionpolicy -executionpolicy unrestricted -force -scope LocalMachine
$newname = "${var.demo_org_name}-${var.windows_hostnames[count.index]}"
Rename-Computer -NewName $newname -Force
Restart-Computer

</powershell>
EOF

  root_block_device {
    delete_on_termination = true
    volume_size           = 100
    volume_type           = "gp2"
  }

  tags = {
    Name          = "${var.demo_org_name}-${var.windows_hostnames[count.index]}"
    X-Dept        = "${var.tag_dept}"
    X-Customer    = "${var.tag_customer}"
    X-Project     = "${var.tag_project}"
    X-Application = "${var.tag_application}"
    X-Contact     = "${var.tag_contact}"
    X-TTL         = "${var.tag_ttl}"
  }

  provisioner "local-exec" {
    command = <<-LOCAL
      knife bootstrap winrm://${coalesce(self.public_ip, self.private_ip)} -N ${self.tags.Name} -P '${var.windows_password}' -U Administrator --policy-group ${element(split("-", var.windows_hostnames[count.index]),0)}-${element(split("-", var.windows_hostnames[count.index]),1)} --policy-name ${element(split("-", var.windows_hostnames[count.index]),0)}_${element(split("-", var.windows_hostnames[count.index]),1)} -y
    LOCAL
  }
}
