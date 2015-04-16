#!/bin/sh

echo -n "type the name of user you want to add"
echo 
read name

adduser $name
gpasswd -a $name sudo
