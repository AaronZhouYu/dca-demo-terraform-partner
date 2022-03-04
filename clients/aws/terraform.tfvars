aws_region = "ap-southeast-1"
aws_profile = "sa"
aws_credentials_file = "~/.aws/credentials"
aws_key_pair_name = "aaron_apac_aws"
aws_key_pair_file = "~/.ssh/aaron_apac_aws.pem"

tag_customer = "Progress Chef"
tag_project = "Demo"
tag_name = "Aaron"
tag_dept = "Sales"
tag_contact = "aaron.zhouyu@progress.com"
tag_application = "APAC"
tag_ttl = "120"

redhat_hostnames = [
    "stage-redhat-0",
    "stage-redhat-1",
    "prod-redhat-2",
    "prod-redhat-3",
    "prod-redhat-4",
]

windows_hostnames = [
    "stage-windows-0",
    "stage-windows-1",
    "prod-windows-2",
    "prod-windows-3",
    "prod-windows-4",
]

windows_instance_type = "t3.xlarge"
linux_instance_type = "t3.medium"
redhat_ami_user = "ec2-user"
chef_client_version = "latest"

automate_hostname = "aaron-dca.chef-demo.com"
demo_org_name = "chef"

windows_password = "Your Preferred Password for Windows Instance"
windows_chef_client_version = "17.9.46"
windows_version = "2019"
