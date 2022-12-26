#!/bin/bash

function provision_infra() {
  cd terraform && \
      terraform apply && \
      terraform output -json | tee output.json && cd ..
}

function config_ansible_hosts() {
  /usr/bin/python3 parse_tf_output.py
}

function setup_k8s_cluster() {
  cd ansible && ansible-playbook -i hosts.ini playbook.yml -v
}

provision_infra && config_ansible_hosts && setup_k8s_cluster