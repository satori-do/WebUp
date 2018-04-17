#!/bin/bash

apt-get install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository -y "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
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
cp /vagrant/config.php  /home/vagrant/rename.kr.ua/config/

docker pull mysql:5.7
docker pull php:7.0-apache

cd /home/vagrant/rename.kr.ua/

docker build -t phpach .

docker run --name rename-db -v /var/lib/mysql:/var/lib/mysql -v /vagrant/rmkr.sql:/docker-entrypoint-initdb.d/rmkr.sql:ro -e MYSQL_ROOT_PASSWORD_FILE=/vagrant/mysql-root -d mysql:5.7
docker run -d -p 80:80 --name rename.kr.ua --link rename-db:db phpach:latest
