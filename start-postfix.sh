#!/bin/sh

#set -x

for path in /etc/postfix.overrides/*; do
    file=$(basename $path)

    echo "Linking /etc/postfix/$file -> $path"
    ln -sf $path /etc/postfix/$file
done

apt-get --fix-broken install

[ -f /etc/postfix.overrides/postfix.init ] && . /etc/postfix.overrides/postfix.init

/usr/sbin/syslog-ng -F --no-caps &
postfix start-fg
