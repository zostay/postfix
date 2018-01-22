#!/bin/sh

cp -v /usr/local/share/postfix/postfix-files /etc/postfix/postfix-files
apt-get --fix-broken install

ls -la /usr/local/share/postfix
echo ----------------------------------------------------------------
ls -la /etc/postfix

postfix start && journalctl -f
