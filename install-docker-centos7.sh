#!/bin/bash
# Script auto install docker CentOS 7

# Setting up repository
sudo yum install -y yum-utils
sudo yum-config-manager \
--add-repo \
https://download.docker.com/linux/centos/docker-ce.repo

# Install docker Engine
sudo yum install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

# Start docker service
sudo systemctl enable docker && sudo systemctl start docker
sudo systemctl status docker
