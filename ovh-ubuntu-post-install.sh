#!/usr/bin/env bash

set -e
adduser --disabled-password --gecos "" ubuntu
usermod -aG sudo ubuntu
mkdir -v /home/ubuntu/.ssh
mv -v /root/.ssh/authorized_keys2 /home/ubuntu/.ssh/authorized_keys
chown -R ubuntu:ubuntu /home/ubuntu/.ssh
chmod og-rwx /home/ubuntu/.ssh
echo 'ubuntu ALL=(ALL) NOPASSWD: ALL' | EDITOR='tee -a' visudo
sed -i 's/PasswordAuthentication yes/PasswordAuthentication no/g' /etc/ssh/sshd_config
sed -i 's/PermitRootLogin yes/PermitRootLogin no/g' /etc/ssh/sshd_config
systemctl restart sshd

# I have no idea how this exit code might be used
exit 42
