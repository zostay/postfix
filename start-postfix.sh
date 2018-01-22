#!/bin/sh

for path in /etc/postfix.overrides/* do
    file=$(basename $path)

    echo "Linking /etc/postfix/$file -> $path"
    ln -sf /etc/postfix/$file $path
done

apt-get --fix-broken install

postfix start && journalctl -f
