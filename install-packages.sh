#!/bin/bash

ID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
LOGFILE="tmp/$0-$TIMESTAMP.log"

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

VALIDATE( ){
    if [ $1 -ne 0 ]
    then
        echo -e "$2... $R FAILED $N" 
    else
        echo -e "$2... $G SUCCESS $N" 
    fi
}

if [ $ID -ne 0 ]
then
    echo  -e "$R ERROR:: Please run this script with root access $N"
    exit 1
else   
    echo "You are root user"
fi

for package in $@
do
    yum list installed $package
    if [ $? -ne 0 ]
    then
        yum install $package -y
        VALIDATE $? "Installing package" &>>LOGFILE
    else
        echo -e "Package already installed $Y SKIPPING $N"
    fi

done


