variable "redhat_hostnames" {
  default = ""
  description = "Predefined hostnames for all Chef Client Red Hat nodes"
}

variable "windows_hostnames" {
  default = ""
  description = "Predefined hostnames for all Chef Client Windows nodes"
}

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

variable "windows_instance_type" {
  default = ""
  description = "windows_instance_type is the AWS instance type to be used for Windows Chef Infra Client nodes"
}

variable "linux_instance_type" {
  default = ""
  description = "linux_instance_type is the AWS instance type to be used for Linux Chef Infra Client nodes"
}

variable "redhat_ami_user" {
  default = ""
  description = "redhat_ami_user is the default EC2 user which will be given to your Redhat Chef Infra Client instance"
}

variable "chef_client_version" {
  default = ""
  description = "chef_client_version is the version of the Chef Infra Client to be installed on your nodes"
}

variable "automate_hostname" {
  default = ""
  description = "automate_hostname is the hostname which will be given to your automate server instance"
}

variable "route53_zone" {
  default = ""
  description = "To find the r53 zone"
}

variable "demo_org_name" {
  default = ""
  description = "The short organization name used for 'chef-server-ctl org-create'. eg: 'yourcompany'"
}

variable "windows_password" {
  default = ""
  description = "Your predefined password to be used for Windows 'Administrator' and 'chef' user"
}

variable "windows_chef_client_version" {
  default = ""
  description = "The version of the Chef Infra Client to be downloaded and installed for Windows nodes"
}

variable "windows_version" {
  default = ""
  description = "Windows version to be provisioned by terraform"
}
