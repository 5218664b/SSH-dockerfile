#!/bin/sh
PUBLIC_IP=`wget http://ipecho.net/plain -O - -q ; echo`
echo $PUBLIC_IP
cat /etc/ssh/sshd_config
service ssh restart
/usr/sbin/sshd -D