#!/bin/bash

USERID=$(id -u)
LOGS_DIR=/var/log/Shell-script
LOGS_FILE="$LOGS_DIR/$0.log"
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

if [ $USERID -ne 0 ]; then
    echo "$TIMESTAMP Please run this with root access" | tee -a $LOGS_FILE
    exit 1
fi

validate(){
    if [ $2 -eq 0 ]; then 
            echo "$TIMESTAMP $1 is successfully installed" | tee -a $LOGS_FILE
        else 
            echo "$TIMESTAMP $1 installation is failed" | tee -a $LOGS_FILE
            exit 1
        fi
}

for instance in $@
    do
        dnf list installed $instance
    if [ $? -eq 0 ]; then
        echo "$TIMESTAMP $instance is already installed...skipping" | tee -a $LOGS_FILE
    else
        echo "$TIMESTAMP $instance is going to install" | tee -a $LOGS_FILE
        dnf install $instance -y &>> $LOGS_FILE
        validate $instance $?
    fi

    done


