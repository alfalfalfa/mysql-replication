#!/bin/sh

echo "Waiting for master ${MYSQL_MASTER_WAIT_TIME}sec..."
sleep ${MYSQL_MASTER_WAIT_TIME}s

export MYSQL_PWD=${MYSQL_MASTER_ROOT_PASS}
master_pass=${MYSQL_MASTER_ROOT_PASS}
log_file=`mysql -u root -h master -e "SHOW MASTER STATUS\G" | grep File: | awk '{print $2}'`
pos=`mysql -u root -h master -e "SHOW MASTER STATUS\G" | grep Position: | awk '{print $2}'`

export MYSQL_PWD=${MYSQL_ROOT_PASSWORD}
mysql -u root -e "CHANGE MASTER TO MASTER_HOST='master', MASTER_USER='root', MASTER_PASSWORD='${master_pass}', MASTER_LOG_FILE='${log_file}', MASTER_LOG_POS=${pos};"
mysql -u root -e "start slave"

