#!/bin/sh
PUBLIC_IP=`wget http://ipecho.net/plain -O - -q ; echo`
echo $PUBLIC_IP
cat /etc/ssh/sshd_config
#/usr/sbin/sshd -D