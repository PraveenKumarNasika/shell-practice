#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "Please run this with root access"
    exit 1
fi

validate(){
    if [ $2 -eq 0 ]; then 
            echo "$2 is successfully installed"
        else 
            echo "$2 installation is failed"
        fi
}


dnf list installed nginx
    if [ $? -eq 0 ]; then
        echo "nginx is already installed...skipping"
    else
        echo "nginx is going to install"
        dnf install nginx -y
        validate nginx $?
    fi
