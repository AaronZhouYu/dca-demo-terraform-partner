resource "aws_instance" "chef_clients_redhat" {
  count                  = "${length(var.redhat_hostnames)}"
  ami                    = data.aws_ami.rhel-8.id
  instance_type          = var.linux_instance_type
  key_name               = var.aws_key_pair_name
  availability_zone      = "${var.aws_region}a"
  subnet_id              = aws_subnet.chef-subnet-a.id
  vpc_security_group_ids = [aws_security_group.chef_clients.id]
  associate_public_ip_address = true
  ebs_optimized          = true

  root_block_device {
    delete_on_termination = true
    volume_size           = 100
    volume_type           = "gp2"
  }

  tags = {
    Name          = "${var.demo_org_name}-${var.redhat_hostnames[count.index]}"
    X-Dept        = "${var.tag_dept}"
    X-Customer    = "${var.tag_customer}"
    X-Project     = "${var.tag_project}"
    X-Application = "${var.tag_application}"
    X-Contact     = "${var.tag_contact}"
    X-TTL         = "${var.tag_ttl}"
  }

  connection {
    user        = var.redhat_ami_user
    private_key = file(var.aws_key_pair_file)
    host        = coalesce(self.public_ip, self.private_ip)
    agent       = true
    type        = "ssh"
  }

  provisioner "remote-exec" {
    inline = [
      "while [ ! -f /var/lib/cloud/instance/boot-finished ]; do echo 'Waiting for cloud-init...'; sleep 1; done"
    ]
  }

  provisioner "local-exec" {
    command = <<-LOCAL
      knife bootstrap ${var.redhat_ami_user}@${coalesce(self.public_ip, self.private_ip)} -N ${self.tags.Name} -i ${var.aws_key_pair_file} --sudo --policy-group ${element(split("-", var.redhat_hostnames[count.index]),0)}-${element(split("-", var.redhat_hostnames[count.index]),1)} --policy-name ${element(split("-", var.redhat_hostnames[count.index]),0)}_${element(split("-", var.redhat_hostnames[count.index]),1)} -y
    LOCAL
  }
}
