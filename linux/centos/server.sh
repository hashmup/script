#!/bin/sh

echo -n "Which service do you want to use?"
echo -n "1: apache"
echo -n "2: nginx"
read ser

. ~/script/linux/centos/serverconfig.sh

case "$ser" in
	"1" ) . ~/script/linux/centos/apache.sh ;;
	"2" ) . ~/script/linux/centos/nginx.sh ;;
esac
