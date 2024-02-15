#!/bin/bash

ID=$(id -u)

if [ $ID -ne 0];
then
    echo "Error::please run this script with root user"
else
    echo "Success"
fi

yum install mysql -y

if [ $? -ne o]
then
    echo "Installing mysql is failed"
else
    echo "Installing mysql is Success"
fi

