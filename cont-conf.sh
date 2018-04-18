#!/bin/bash

cp /home/vagrant/rename.kr.ua/config/config.php.example  /home/vagrant/rename.kr.ua/config/config.php

cd /home/vagrant/rename.kr.ua/config/

sed -i "s/'server' => 'localhost'/'server' => '${MYSQL_HOSTNAME}'/" config.php
sed -i "s/'username' => 'root'/'username' => '${MYSQL_USER}'/" config.php
sed -i "s/'password' => '123456'/'password' => '${MYSQL_ROOT_PASSWORD}'/" config.php
sed -i "s/'database_name' => 'rename'/'database_name' => '${MYSQL_DATABASE}'/" config.php
