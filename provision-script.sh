#!/bin/bash

apt-get install -y apt-transport-https ca-certificates
curl software-properties-common
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
else
    cd /home/vagrant/rename.kr.ua/
    git pull
fi

cp /vagrant/Dockerfile  /home/vagrant/rename.kr.ua/

docker pull mysql:5.7
docker pull php:7.0-apache

cd /home/vagrant/rename.kr.ua/

CMYSQL=rename-db
CWEB=rename.kr.ua

docker rm -f ${CMYSQL} ${CWEB}


docker build -t phpach .

docker run --name ${CMYSQL} -v /var/lib/mysql:/var/lib/mysql \
           -v /vagrant/rmkr.sql:/docker-entrypoint-initdb.d/rmkr.sql:ro \
           --env-file /vagrant/credential -e MYSQL_RANDOM_ROOT_PASSWORD=yes \
           --restart always \
           -d mysql:5.7

docker run -d --restart always --name ${CWEB} -p 80:80 \
           --link ${CMYSQL}:db --env-file /vagrant/credential \
           phpach:latest
