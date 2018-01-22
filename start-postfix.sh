#!/bin/sh

cp /usr/local/share/postfix/postfix-files /etc/postfix/postfix-files
apt-get --fix-broken install

ls -la /etc/postfix

postfix start && journalctl -f
