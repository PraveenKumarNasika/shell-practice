#!/bin/bash

USERID=$(id -u)
LOGS_DIR=/var/log/Shell-script
LOGS_FILE="$LOGS_DIR/$0.log"
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

R="\e[31m"  
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $USERID -ne 0 ]; then
    echo "$TIMESTAMP $R Please run this with root access $N" | tee -a $LOGS_FILE
    exit 1
fi

validate(){
    if [ $2 -eq 0 ]; then 
            echo "$TIMESTAMP $1 is $G successfully installed $N" | tee -a $LOGS_FILE
        else 
            echo "$TIMESTAMP $1 $R installation is failed $N " | tee -a $LOGS_FILE
            exit 1
        fi
}

for instance in $@
    do
        dnf list installed $instance
    if [ $? -eq 0 ]; then
        echo "$TIMESTAMP $instance is already $Y installed...skipping $N" | tee -a $LOGS_FILE
    else
        echo "$TIMESTAMP $instance is going to install" | tee -a $LOGS_FILE
        dnf install $instance -y &>> $LOGS_FILE
        validate $instance $?
    fi

    done


