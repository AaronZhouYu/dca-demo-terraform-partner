output "automate_public_ip" {
  value = "${aws_instance.chef_automate.public_ip}"
}

output "automate_public_dns" {
  value = "${aws_instance.chef_automate.public_dns}"
}

output "automate_lb_dns" {
  value = "${aws_lb.chef_automate.dns_name}"
}

output "automate_admin" {
  value = data.external.automate_secrets.result["automate_admin"]
}

output "automate_admin_password" {
  value = var.automate_admin_password
}

output "demo_token" {
  value = data.external.automate_secrets.result["automate_demo_token"]
}

output "ingest_token" {
  value = data.external.automate_secrets.result["automate_ingest_token"]
}

output "automate_token" {
  value = var.automate_api_token
}

output "automate_url" {
  value = data.external.automate_secrets.result["automate_url"]
}
