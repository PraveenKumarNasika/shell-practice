#!/bin/bash

USERID=$(id -u)
LOGS_DIR=/var/log/Shell-script
LOGS_FILE="$LOGS_DIR/$0.log"
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

set -e

R="\e[31m"  
G="\e[32m"
Y="\e[33m"
N="\e[0m"

trap 'echo "error at $LINENO", command: $BASH_COMMAND"' ERR

if [ $USERID -ne 0 ]; then
    echo -e "$TIMESTAMP $R Please run this with root access $N" | tee -a $LOGS_FILE
    exit 1
fi


for instance in $@
    do
        dnf list installed $instance
    if [ $? -eq 0 ]; then
        echo -e "$TIMESTAMP $instance is already $Y installed...skipping $N" | tee -a $LOGS_FILE
    else
        echo -e "$TIMESTAMP $instance is going to install" | tee -a $LOGS_FILE
        dnf install $instance -y &>> $LOGS_FILE
        validate $instance $?
    fi

    done


