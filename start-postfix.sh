#!/bin/sh

for file in postfix-files post-install postfix-script; do
    if [ ! -e "/etc/postfix/$file" ]; then
        cp -v "/usr/local/share/postfix/$file" "/etc/postfix/$file"

        if [ ! -f "/etc/postfix/$file" ]; then
            echo "FAILED TO COPY $file"
        fi
    fi
done

apt-get --fix-broken install

ls -la /usr/local/share/postfix
echo ----------------------------------------------------------------
ls -la /etc/postfix

postfix start && journalctl -f
