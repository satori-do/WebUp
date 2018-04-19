#!/bin/bash

set -e
cp ${CONFIG_FILE}.example ${CONFIG_FILE}

sed -i "s/'server' => 'localhost'/'server' => '${MYSQL_HOSTNAME}'/" ${CONFIG_FILE}
sed -i "s/'username' => 'root'/'username' => '${MYSQL_USER}'/" ${CONFIG_FILE}
sed -i "s/'password' => '123456'/'password' => '${MYSQL_PASSWORD}'/" ${CONFIG_FILE}
sed -i "s/'database_name' => 'rename'/'database_name' => '${MYSQL_DATABASE}'/" ${CONFIG_FILE}
