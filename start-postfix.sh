#!/bin/sh

set -e

for path in /etc/postfix.overrides/*; do
    file=$(basename $path)

    echo "Linking /etc/postfix/$file -> $path"
    ln -sf /etc/postfix/$file $path
done

apt-get --fix-broken install

# Make sure mail.log exists first
touch /var/log/mail.log

service syslog-ng start
postfix start && tail -F /var/log/mail.log
