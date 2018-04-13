#!/bin/bash

apt-get update -y
apt-get upgrade -y
apt-get install -y \
       git \
       htop \
       mc

apt-get install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository -y "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt-get update
apt-get install -y docker-ce

sudo gpasswd -a vagrant docker

if [ ! -e rename.kr.ua ]; then
git clone https://github.com/Onix-Systems/rename.kr.ua.git
else
cd rename.kr.ua
git pull
fi

docker run --name rename-db -v /var/lib/mysql:/var/lib/mysql -v /vagrant/rmkr.sql:/docker-entrypoint-initdb.d/rmkr.sql:ro -eMYSQL_DATABASE=rmkr -e MYSQL_ROOT_PASSWORD=123456 -d mysql:5.7 --character-set-server=utf8 --collation-server=utf8_general_ci


# apt-get purge docker-ce
# rm -rf /var/lib/docker
