#!/bin/bash
knife node delete chef-stage-redhat-0 --yes
knife client delete chef-stage-redhat-0 --yes

knife node delete chef-stage-redhat-1 --yes
knife client delete chef-stage-redhat-1 --yes

knife node delete chef-prod-redhat-2 --yes
knife client delete chef-prod-redhat-2 --yes

knife node delete chef-prod-redhat-3 --yes
knife client delete chef-prod-redhat-3 --yes

knife node delete chef-prod-redhat-4 --yes
knife client delete chef-prod-redhat-4 --yes

knife node delete chef-stage-windows-0 --yes
knife client delete chef-stage-windows-0 --yes

knife node delete chef-stage-windows-1 --yes
knife client delete chef-stage-windows-1 --yes

knife node delete chef-prod-windows-2 --yes
knife client delete chef-prod-windows-2 --yes

knife node delete chef-prod-windows-3 --yes
knife client delete chef-prod-windows-3 --yes

knife node delete chef-prod-windows-4 --yes
knife client delete chef-prod-windows-4 --yes
