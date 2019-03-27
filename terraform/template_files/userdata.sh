#!/bin/bash
echo "Installing pip"
sudo yum install -y python-pip
echo "Installing ansible via pip"
sudo pip install ansible
echo "Installing git"
sudo yum install -y git
echo "Cloning git repo"
git clone https://github.com/soony88/kafka-playground.git
echo "Running playbook"
ansible-playbook kafka-playground/ansible/playbook_local.yml -i kafka-playground/ansible/hosts.yml
