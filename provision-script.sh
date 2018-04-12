#!/bin/bash

apt-get update -y
apt-get upgrade -y
apt-get install git -y
apt-get install htop -y
apt-get install mc -y
apt-get install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository -y "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt-get update
apt-get install -y docker-ce -y

#sudo groupadd docker
sudo gpasswd -a vagrant docker
#echo $USER
#sudo newgrp docker

#docker run hello-world

docker pull mysql
#apt-get update
#cd /var/www/html

#if [ ! -e rename.kr.ua ]; then
#git clone https://github.com/Onix-Systems/rename.kr.ua.git
#else
#cd rename.kr.ua
#git pull
#fi

# sudo docker pull nixes/ubuntu-lamp
# docker build -t="leafney/ubuntu-mysql" .
# docker run --name mysql -v /var/docker_data/mysql/data/:/var/lib/mysql -d -p 3306:3306 leafney/ubuntu-mysql

# apt-get purge docker-ce
# rm -rf /var/lib/docker



