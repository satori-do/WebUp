#!/bin/bash

set -e

apt-get install -y \
      apt-transport-https \
      ca-certificates \
      curl \
      software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository -y \
"deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt-get update -y
apt-get upgrade -y
apt-get install -y \
       git \
       htop \
       mc \
       docker-ce

#sudo gpasswd -a vagrant docker
sudo usermod -aG docker vagrant

if [ ! -e rename.kr.ua ]; then
    git clone https://github.com/Onix-Systems/rename.kr.ua.git
    cp /vagrant/Dockerfile  /home/vagrant/rename.kr.ua/
    cp /vagrant/rmkr.sql  /home/vagrant/rename.kr.ua/
    sudo cp /vagrant/credential  /home/vagrant/rename.kr.ua/
    cd /home/vagrant/rename.kr.ua/
else
    cd /home/vagrant/rename.kr.ua/
    git pull
fi

docker pull mysql:5.7
docker pull php:7.0-apache

CMYSQL=rename-db
CWEB=rename.kr.ua

if [ ! -z "$(docker ps -q -f name=rename-db)"]; then
    docker rm -f ${CMYSQL} ${CWEB}
fi
if [ -z "$(docker ps -q -f name=rename-db)"]; then

docker build -t phpach .

docker run --name ${CMYSQL} -v /var/lib/mysql:/var/lib/mysql \
           -v $PWD/rmkr.sql:/docker-entrypoint-initdb.d/rmkr.sql:ro \
           --env-file /home/vagrant/rename.kr.ua/credential -e MYSQL_RANDOM_ROOT_PASSWORD=yes \
           --restart always \
           -d mysql:5.7

docker run -d --restart always --name ${CWEB} -p 80:80 \
           --link ${CMYSQL}:db --env-file /home/vagrant/rename.kr.ua/credential \
           phpach:latest
fi
