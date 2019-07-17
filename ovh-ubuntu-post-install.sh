#!/usr/bin/env bash

set -e
adduser --disabled-password --gecos "" ubuntu
usermod -aG sudo ubuntu
mkdir -v /home/ubuntu/.ssh
mv -v /root/.ssh/authorized_keys2 /home/ubuntu/.ssh/authorized_keys
chown -R ubuntu:ubuntu /home/ubuntu/.ssh
chmod og-rwx /home/ubuntu/.ssh
echo 'ubuntu ALL=(ALL) NOPASSWD: ALL' | EDITOR='tee -a' visudo

exit 42
