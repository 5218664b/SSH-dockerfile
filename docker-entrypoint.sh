#!/bin/sh
echo 1111
wget http://ipecho.net/plain -O - -q
/usr/sbin/sshd -D