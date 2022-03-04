variable "aws_region" {
  default = ""
  description = "aws_region is the AWS region in which we will build instances"
}

variable "aws_profile" {
  default = ""
  description = "aws_profile is the profile from your credentials file which we will use to authenticate to the AWS API."
}

variable "aws_credentials_file" {
  default = ""
  description = "aws_credentials_file is the file on your local disk from which we will obtain your AWS API credentials."
}

variable "aws_key_pair_name" {
  default = ""
  description = "aws_key_pair_naem is the AWS keypair we will configure on all newly built instances."
}

variable "aws_key_pair_file" {
  default = ""
  description = "aws_key_pair_file is the local SSH private key we will use to log in to AWS instances"
}

variable "tag_customer" {
  default = ""
  description = "tag_customer is the customer tag which will be added to AWS"
}

variable "tag_project" {
  default = ""
  description = "tag_project is the project tag which will be added to AWS"
}

variable "tag_name" {
  default = ""
  description = "tag_name is the name tag which will be added to AWS"
}

variable "tag_dept" {
  default = ""
  description = "tag_dept is the department tag which will be added to AWS"
}

variable "tag_contact" {
  default = ""
  description = "tag_contact is the contact tag which will be added to AWS"
}

variable "tag_application" {
  default = ""
  description = "tag_application is the application tag which will be added to AWS"
}

variable "tag_ttl" {
  default = ""
  description = "tag_ttl is the time to live tag which will be added to AWS"
}

variable "automate_server_instance_type" {
  default = ""
  description = "automate_server_instance_type is the AWS instance type to be used for hef Automate"
}

variable "disable_event_tls" {
  default = ""
}

variable "automate_ami_user" {
  default = ""
  description = "automate_ami_user is the default EC2 user which will be given to your automate server instance"
}

variable "automate_hostname" {
  default = ""
  description = "automate_hostname is the hostname which will be given to your automate server instance"
}

variable "automate_license" {
  default = ""
}

variable "automate_channel" {
  default = ""
  description = "The Chef Automate upgrade process makes use of release channels to allow greater control over the automatic upgrades applied to your system"
}

variable "automate_products" {
  default = ""
  description = "Automate products to be deployed"
}

variable "automate_admin_password" {
  default = ""
  description = "Your preferred admin password for the Automate"
}

variable "route53_zone" {
  default = ""
  description = "To find the r53 zone"
}

variable "alb_acm_domain-name" {
  default = ""
  description = "Matcher to look up the ACM cert for the ALB (when using chef_automate_alb.tf)"
}

variable "origin" {
  default = ""
  description = "habitat origin to use for packages in the Effortless demo"
}

variable "platform" {
  default = ""
  description = "platform will be used to specify the correctl home directory to be used during A2 setup"
}

variable "automate_api_token" {
  default = ""
  description = "Hardcoded API token used for the Chef Desktop demo"
}

variable "demo_user_name" {
  default = ""
  description = "The user name used for 'chef-server-ctl user-create'."
}

variable "demo_user_first_name" {
  default = ""
  description = "The first name of the user used for 'chef-server-ctl user-create'."
}

variable "demo_user_last_name" {
  default = ""
  description = "The last name of the user used for 'chef-server-ctl user-create'."
}

variable "demo_user_email" {
  default = ""
  description = "The email address of the user used for 'chef-server-ctl user-create'."
}

variable "demo_password" {
  default = ""
  description = "The password used for 'chef-server-ctl user-create'."
}

variable "demo_org_name" {
  default = ""
  description = "The short organization name used for 'chef-server-ctl org-create'. eg: 'yourcompany'"
}

variable "demo_org_full_name" {
  default = ""
  description = "The full organization name used for 'chef-server-ctl org-create'. eg: 'Your Company'"
}