#!/bin/bash

useradd -u 1000 centos
usermod -aG wheel centos
yum update -y && yum install vim -y

visudo

vim /etc/ssh/sshd_config

# PubkeyAuthentication yes
# PasswordAuthentication no

systemctl restart sshd
su centos
cd ~/
mkdir .ssh
chmod 700 .ssh
cd .ssh
touch authorized_keys
# echo 'ssh-rsa public key' >> authorized_keys
chmod 600 authorized_keys

curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker centos
sudo systemctl restart docker

exit
head /dev/urandom | tr -dc A-Za-z0-9 | head -c 32 ; echo ''
passwd

