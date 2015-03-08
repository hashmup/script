#!/bin/sh

echo -n "Which service do you want to use?"
echo -n "1: apache"
echo -n "2: nginx"
read ser

. ~/script/linux/serverconfig.sh

case "$ser" in
	"1" ) . ~/script/linux/apache.sh ;;
	"2" ) . ~/script/linux/nginx.sh ;;
esac