#!/bin/sh

# Install docker
apt-get update
apt-get purge "docker.io*"
apt-get update
apt-get install -y apt-transport-https ca-certificates
apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
echo "deb https://apt.dockerproject.org/repo debian-jessie main" > /etc/apt/sources.list.d/docker.list
apt-get update
apt-get install -y docker-engine=1.11.2-0~jessie

# Install Kubernetes (kubectl)
export KUBERNETES_VERSION=1.4.3
wget -q -O /opt/kubernetes.tar.gz "https://github.com/kubernetes/kubernetes/releases/download/v${KUBERNETES_VERSION}/kubernetes.tar.gz"
cd /usr/local/bin
tar -xvzf /opt/kubernetes.tar.gz kubernetes/platforms/linux/386/kubectl --strip-components=4

chown jenkins:jenkins /var/run/docker.sock
