set -Eeu

. /etc/os-release
case $ID in
  rhel)
    sudo yum update -y && sudo yum upgrade -y
    ;;
  ubuntu)
    sudo apt update -y && sudo apt upgrade -y
    export LC_ALL='en_US.UTF-8' && export LC_CTYPE='en_US.UTF-8' && sudo dpkg-reconfigure --frontend=noninteractive locales
    ;;
esac

sudo hostname ${tags_name}
sudo hostnamectl set-hostname ${tags_name}
echo ${tags_name} | sudo tee /etc/hostname
sudo mkdir -p /etc/chef && sudo mkdir -p /var/lib/chef && sudo mkdir -p /var/log/chef
curl -L https://omnitruck.chef.io/install.sh | sudo bash -s -- -P chef -d /tmp -v ${chef_client_version}

# Create first-boot.json
sudo bash -c 'cat << EOF > /etc/chef/first-boot.json
{
    "policy_group": "${policy_group}",
    "policy_name": "${policy_name}"
}
EOF'

sudo mv ~/${demo_org_name}-validator.pem /etc/chef/${demo_org_name}-validator.pem
echo 'log_location STDOUT' | sudo tee /etc/chef/client.rb
echo 'chef_server_url "https://${automate_hostname}/organizations/${demo_org_name}"' | sudo tee -a /etc/chef/client.rb
echo 'validation_client_name "${demo_org_name}-validator"' | sudo tee -a /etc/chef/client.rb
echo 'validation_key "/etc/chef/${demo_org_name}-validator.pem"' | sudo tee -a /etc/chef/client.rb
echo 'node_name  "${tags_name}"' | sudo tee -a /etc/chef/client.rb
echo 'ssl_verify_mode :verify_none' | sudo tee -a /etc/chef/client.rb
echo 'chef_license "accept"' | sudo tee -a /etc/chef/client.rb
sudo chef-client -j /etc/chef/first-boot.json