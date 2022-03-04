#!/bin/bash
echo " ***********************************"
echo " ****** Install Chef Automate ******"
echo " ***********************************"

. /etc/os-release
case $ID in
  rhel)
    sudo yum install epel-release -y
    sudo yum update -y && sudo yum upgrade -y
    ;;
  ubuntu)
    export DEBIAN_FRONTEND=noninteractive
    sudo apt update -y && sudo apt upgrade -y
    ;;
esac

sudo hostnamectl set-hostname ${automate_hostname}
echo vm.max_map_count=262144 | sudo tee -a /etc/sysctl.conf
echo vm.dirty_expire_centisecs=20000 | sudo tee -a /etc/sysctl.conf
sudo sysctl -p /etc/sysctl.conf

curl https://packages.chef.io/files/current/latest/chef-automate-cli/chef-automate_linux_amd64.zip | gunzip - > chef-automate && chmod +x chef-automate
sudo mv chef-automate /usr/sbin/chef-automate
sudo chef-automate airgap bundle create
sudo mv automate-*.aib /tmp/automate.aib

sudo chef-automate init-config
sudo sed -i 's/channel = \".*\"/channel = \"${automate_channel}\"/g' ~/config.toml
sudo sed -i 's/license = \".*\"/license = \"${automate_license}\"/g' ~/config.toml
sudo chef-automate deploy ~/config.toml --accept-terms-and-mlsa ${automate_products} --airgap-bundle /tmp/automate.aib
sudo chown ${automate_ami_user}:${automate_ami_user} ~/automate-credentials.toml

sudo hab license accept
sudo hab pkg install chef/applications-service -b
sleep 30
sudo chef-automate config patch /tmp/automate-update.toml
sudo chef-automate iam admin-access restore "${automate_admin_password}"

export DEMO_TOKEN=$(sudo chef-automate iam token create demo --admin)
echo demo-token = "$DEMO_TOKEN" >> ~/automate-credentials.toml
export INGEST_TOKEN=$(sudo chef-automate iam token create ingest)
echo ingest-token = "$INGEST_TOKEN" >> ~/automate-credentials.toml

curl -sk -H "api-token: $DEMO_TOKEN" -H "Content-Type: application/json" -d '{"name":"automate-token","value": "${automate_api_token}","active": true, "id": "automate-token"}' https://localhost/apis/iam/v2/tokens -X POST
curl -sk -H "api-token: $DEMO_TOKEN" -H "Content-Type: application/json" -d '{"members":["token:automate-token"]}' https://localhost/apis/iam/v2/policies/administrator-access/members:add

curl -sk -H "api-token: $DEMO_TOKEN" -H "Content-Type: application/json" https://localhost/apis/iam/v2/policies
curl -sk -H "api-token: $DEMO_TOKEN" -H "Content-Type: application/json" -d '{"members":["token:ingest"]}' https://localhost/apis/iam/v2/policies/ingest-access/members:add
curl -sk -H "api-token: $DEMO_TOKEN" -H "Content-Type: application/json" -d '{"id": "development", "name": "Development"}' https://localhost/apis/iam/v2/projects
curl -sk -H "api-token: $DEMO_TOKEN" -H "Content-Type: application/json" -d '{"id": "test", "name": "Test"}' https://localhost/apis/iam/v2/projects
curl -sk -H "api-token: $DEMO_TOKEN" -H "Content-Type: application/json" -d '{"id": "production", "name": "Production"}' https://localhost/apis/iam/v2/projects

curl -sk -H "api-token: $DEMO_TOKEN" -H "Content-Type: application/json" -d @project-development-rule.json https://localhost/apis/iam/v2/projects/development/rules
curl -sk -H "api-token: $DEMO_TOKEN" -H "Content-Type: application/json" -d @project-test-rule.json https://localhost/apis/iam/v2/projects/test/rules
curl -sk -H "api-token: $DEMO_TOKEN" -H "Content-Type: application/json" -d @project-production-rule.json https://localhost/apis/iam/v2/projects/production/rules
curl -sk -H "api-token: $DEMO_TOKEN" -H "Content-Type: application/json" https://localhost/apis/iam/v2/apply-rules -X POST

sudo chef-server-ctl user-create ${demo_user_name} ${demo_user_first_name} ${demo_user_last_name} ${demo_user_email} ${demo_password} --filename /tmp/${demo_user_name}.pem
sudo chef-server-ctl org-create ${demo_org_name} "${demo_org_full_name}" --association_user ${demo_user_name} --filename /tmp/${demo_org_name}-validator.pem