#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "Please run this with root access"
    exit 1
fi

dnf list installed nginx
    if [ $? -eq 0 ]; then
        echo "nginx is already installed...skipping"
    else
        echo "nginx is going to install"
        dnf install nginx -y
        if [ $? -eq 0 ]; then 
            echo "nginx is successfully installed"
        else 
            echo "nginx installation is failed"
        fi
    fi
