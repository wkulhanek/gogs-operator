#!/bin/bash
# Update latest Roles
rm -rf roles/*
git clone https://github.com/redhat-gpte-devopsautomation/ansible-operator-roles
cp -R ansible-operator-roles/roles/postgresql-ocp ./roles
cp -R ansible-operator-roles/roles/gogs-ocp ./roles
cp ansible-operator-roles/playbooks/gogs.yaml ./playbook.yaml
rm -rf ansible-operator-roles

# Now build the Operator
operator-sdk build quay.io/wkulhanek/gogs-operator:v0.0.1
docker push quay.io/wkulhanek/gogs-operator:v0.0.1
