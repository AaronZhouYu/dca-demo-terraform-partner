#!/bin/bash
set -eu -o pipefail

export ssh_user
export ssh_key
export automate_ip
export user_key
export org_validator_key

eval "$(jq -r '@sh "export ssh_user=\(.ssh_user) ssh_key=\(.ssh_key) automate_ip=\(.automate_ip) user_key=\(.user_key) org_validator_key=\(.org_validator_key)"')"
scp -o stricthostkeychecking=no -i ${ssh_key} ${ssh_user}@${automate_ip}:/home/${ssh_user}/automate-credentials.toml ../../.chef/automate-credentials.toml
scp -o stricthostkeychecking=no -i ${ssh_key} ${ssh_user}@${automate_ip}:/tmp/${org_validator_key} ../../.chef/${org_validator_key}
scp -o stricthostkeychecking=no -i ${ssh_key} ${ssh_user}@${automate_ip}:/tmp/${user_key} ../../.chef/${user_key}

automate_admin="$(cat ../../.chef/automate-credentials.toml | sed -n -e 's/^username = //p' | tr -d '"')"
automate_password="$(cat ../../.chef/automate-credentials.toml | sed -n -e 's/^password = //p' | tr -d '"')"
automate_demo_token="$(cat ../../.chef/automate-credentials.toml | sed -n -e 's/^demo-token = //p' | tr -d '"')"
automate_ingest_token="$(cat ../../.chef/automate-credentials.toml | sed -n -e 's/^ingest-token = //p' | tr -d '"')"
automate_url="$(cat ../../.chef/automate-credentials.toml | sed -n -e 's/^url = //p' | tr -d '"')"

jq -n --arg automate_admin "$automate_admin" \
      --arg automate_password "$automate_password" \
      --arg automate_demo_token "$automate_demo_token" \
      --arg automate_ingest_token "$automate_ingest_token" \
      --arg automate_url "$automate_url" \
      '{"automate_admin":$automate_admin,"automate_password":$automate_password,"automate_demo_token":$automate_demo_token,"automate_ingest_token":$automate_ingest_token,"automate_url":$automate_url}'