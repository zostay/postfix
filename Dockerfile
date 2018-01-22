FROM ubuntu:xenial
LABEL maintainer="Sterling Hanenkamp \"sterling@hanenkamp.com\""

RUN apt-get update \
    && apt-get -y install postfix \
    && mkdir -p /usr/local/share/postfix \
    && cp -r /etc/postfix/* /usr/local/share/postfix

COPY start-postfix.sh /sbin/start-postfix.sh

ENTRYPOINT [ "/sbin/start-postfix.sh" ]

