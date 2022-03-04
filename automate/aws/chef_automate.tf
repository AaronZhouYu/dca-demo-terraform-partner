resource "aws_instance" "chef_automate" {
  ami                    = data.aws_ami.ubuntu-20.id
  instance_type          = var.automate_server_instance_type
  key_name               = var.aws_key_pair_name
  availability_zone      = "${var.aws_region}a"
  subnet_id              = aws_subnet.chef-subnet-a.id
  vpc_security_group_ids = [aws_security_group.chef_servers.id]
  ebs_optimized          = true

  root_block_device {
    delete_on_termination = true
    volume_size           = 150
    volume_type           = "gp2"
  }

  tags = {
    Name          = "${format("chef_automate_${random_id.instance_id.hex}")}"
    X-Dept        = "${var.tag_dept}"
    X-Customer    = "${var.tag_customer}"
    X-Project     = "${var.tag_project}"
    X-Application = "${var.tag_application}"
    X-Contact     = "${var.tag_contact}"
    X-TTL         = "${var.tag_ttl}"
  }

  connection {
    user        = var.automate_ami_user
    private_key = file(var.aws_key_pair_file)
    host        = coalesce(self.public_ip, self.private_ip)
    agent       = true
    type        = "ssh"
  }

  provisioner "file" {
    destination = "/tmp/automate-update.toml"
    content     = templatefile("${path.module}/templates/automate-update.toml.tpl", { disable_event_tls = var.disable_event_tls })
  }

  provisioner "file" {
    destination = "/tmp/chef_automate.sh"
    content     = templatefile(
      "${path.module}/templates/chef_automate_online.sh.tpl",
      {
        automate_hostname = var.automate_hostname
        automate_license = var.automate_license
        automate_channel = var.automate_channel
        automate_products = var.automate_products
        automate_ami_user = var.automate_ami_user
        automate_admin_password = var.automate_admin_password
        automate_api_token = var.automate_api_token
        demo_user_name = var.demo_user_name
        demo_user_first_name = var.demo_user_first_name
        demo_user_last_name = var.demo_user_last_name
        demo_user_email = var.demo_user_email
        demo_password = var.demo_password
        demo_org_name = var.demo_org_name
        demo_org_full_name = var.demo_org_full_name
      }
    )
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/chef_automate.sh",
      "/tmp/chef_automate.sh"
    ]
  }
  
  provisioner "file" {
    destination = "/tmp/download_profiles.sh"
    source = "${path.module}/data_sources/download_profiles.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/download_profiles.sh",
      "/tmp/download_profiles.sh"
    ]
  }

  provisioner "local-exec" {
    command = <<-EOT
      rm -f ../../.chef
      mkdir -p ../../.chef
      touch ../../.chef/config.rb
      echo 'current_dir = File.dirname(__FILE__)' | tee -a ../../.chef/config.rb
      echo 'log_level :info' | tee -a ../../.chef/config.rb
      echo 'log_location STDOUT' | tee -a ../../.chef/config.rb
      echo 'node_name "${var.demo_user_name}"' | tee -a ../../.chef/config.rb
      echo 'client_key "#{current_dir}/${var.demo_user_name}.pem"' | tee -a ../../.chef/config.rb
      echo 'chef_server_url "https://${var.automate_hostname}/organizations/${var.demo_org_name}"' | tee -a ../../.chef/config.rb
    EOT
  }

  provisioner "local-exec" {
    # Clean up local known_hosts in case we get a re-used public IP
    command = "ssh-keygen -R ${aws_instance.chef_automate.public_ip}"
  }

  provisioner "local-exec" {
    # Write ssh key for Automate server to local known_hosts so we can scp automate-credentials.toml in data.external.automate_secrets
    command = "ssh-keyscan -t ecdsa ${aws_instance.chef_automate.public_ip} >> ~/.ssh/known_hosts"
  }
}

data "external" "automate_secrets" {
  program    = ["bash", "${path.module}/data_sources/get-automate-secrets.sh"]
  query = {
    ssh_user          = var.automate_ami_user
    ssh_key           = var.aws_key_pair_file
    automate_ip       = aws_instance.chef_automate.public_ip
    user_key          = "${var.demo_user_name}.pem"
    org_validator_key = "${var.demo_org_name}-validator.pem"
  }
}

data "aws_route53_zone" "selected" {
  name = "${var.route53_zone}"
}

resource "aws_route53_record" "chef_automate" {
  depends_on = [aws_lb.chef_automate]
  zone_id    = "${data.aws_route53_zone.selected.zone_id}"
  name       = "${var.automate_hostname}"
  type       = "CNAME"
  ttl        = "30"
//records = [aws_instance.chef_automate.public_dns]
  records    = [aws_lb.chef_automate.dns_name]
}

resource "aws_route53_health_check" "automate_server" {
  fqdn              = "${var.automate_hostname}"
  port              = 443
  type              = "HTTPS"
  resource_path     = "/"
  failure_threshold = "5"
  request_interval  = "30"

  tags = {
    "Name" = "Rout53 Health Check"
  }
}
