#!/bin/bash

ID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $ID -ne 0 ]
then
    echo "$R ERROR:: Please run this script with root access $N"
    exit 1
else   
    echo "You are root user"
fi

for package in $@
do
    yum list installed $package
    if $? -ne 0
    then
        yum install $package -y
done

