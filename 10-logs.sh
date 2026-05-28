#!/bin/bash

USERID=$(id -u)
LOGS_DIR=/var/log/Shell-script
LOGS_FILE="$LOGS_DIR/$0.log"

if [ $USERID -ne 0 ]; then
    echo "Please run this with root access" | tee -a $LOGS_FILE
    exit 1
fi

validate(){
    if [ $2 -eq 0 ]; then 
            echo "$1 is successfully installed" | tee -a $LOGS_FILE
        else 
            echo "$1 installation is failed" | tee -a $LOGS_FILE
        fi
}


dnf list installed nginx
    if [ $? -eq 0 ]; then
        echo "nginx is already installed...skipping" | tee -a $LOGS_FILE
    else
        echo "nginx is going to install" | tee -a $LOGS_FILE
        dnf install nginx -y &>> $LOGS_FILE
        validate nginx $?
    fi

dnf list installed mysql
    if [ $? -eq 0 ]; then
        echo "mysql is already installed...skipping" | tee -a $LOGS_FILE
    else
        echo "mysql is going to install"
        dnf install mysql -y &>> $LOGS_FILE 
        validate mysql $?
    fi

