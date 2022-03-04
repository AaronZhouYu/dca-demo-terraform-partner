#!/bin/bash

. /etc/os-release
case $ID in
  rhel)
    sudo yum install epel-release -y
    sudo yum update -y && sudo yum upgrade -y
    yum install -y jq
    ;;
  ubuntu)
    export DEBIAN_FRONTEND=noninteractive
    sudo apt update -y && sudo apt upgrade -y
    sudo apt install -y jq
    ;;
esac

DEMO_TOKEN="$(cat ~/automate-credentials.toml | sed -n -e 's/^demo-token = //p' | tr -d '"')"

for PROFILE in \
linux-baseline \
windows-baseline \
cis-rhel8-level1-server \
cis-rhel8-level2-server \
cis-windows2019-level1-memberserver \
cis-windows2019-level2-memberserver
do
  echo "${PROFILE}"
  VERSION=`curl -s -k -H "api-token: $DEMO_TOKEN" https://localhost/api/v0/compliance/profiles/search -d "{\"name\":\"$PROFILE\"}" | jq -r .profiles[0].version`
  echo "Version: ${VERSION}"
  curl -s -k -H "api-token: $DEMO_TOKEN" -H "Content-Type: application/json" 'https://localhost/api/v0/compliance/profiles?owner=admin' -d "{\"name\":\"$PROFILE\",\"version\":\"$VERSION\"}"
done
