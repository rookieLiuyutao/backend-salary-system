#!/bin/bash

LONGTIME=$(date "+%Y-%m-%d %H:%M:%S")
echo "[$LONGTIME] startup run..." >>/root/startup_run.log
service ssh start >>/root/startup_run.log
#service mysql start >>/root/startup_run.log