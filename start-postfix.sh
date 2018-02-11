#!/bin/sh

#set -x

for path in /etc/postfix.overrides/*; do
    file=$(basename $path)

    echo "Linking /etc/postfix/$file -> $path"
    ln -sf $path /etc/postfix/$file
done

apt-get --fix-broken install

# Make sure mail.log exists first
touch /var/log/mail.log

[ -f /etc/postfix.overrides/postfix.init ] && . /etc/postfix.overrides/postfix.init

service syslog-ng start
postfix start && tail -F /var/log/mail.log
