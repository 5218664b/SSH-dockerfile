#!/bin/sh
echo 1111
PUBLIC_IP=`wget http://ipecho.net/plain -O - -q ; echo`
echo $PUBLIC_IP
/usr/sbin/sshd -D