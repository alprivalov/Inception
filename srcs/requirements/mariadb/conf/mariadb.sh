#!/bin/bash

service mysql start 

sleep 5

mysql_secure_installation << EOF
y
${MYSQL_PASSWORD}
${MYSQL_PASSWORD}
y
y
y
y
EOF

mysql -u root << EOF
CREATE DATABASE IF NOT EXISTS $MYSQL_NAME;
GRANT ALL PRIVILEGES ON $MYSQL_NAME.* TO '$MYSQL_LOGIN'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
FLUSH PRIVILEGES;
EOF

service mysql stop

exec "$@"