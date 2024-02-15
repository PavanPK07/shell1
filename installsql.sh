#!/bin/bash

ID=$(id -u)

if [ $ID -ne 0]
then
    echo "You are not root user"
else
    echo "You are root user"
fi

yum install mysql -y

if [ $? -ne o]
then
    echo "Installing mysql is failed"
else
    echo "Installing mysql is Success"
fi

