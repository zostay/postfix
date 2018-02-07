FROM ubuntu:xenial
LABEL maintainer="Sterling Hanenkamp \"sterling@hanenkamp.com\""

RUN apt-get update \
    && apt-get -y install postfix syslog-ng \
    && mkdir -p /etc/postfix.overrides

COPY start-postfix.sh /sbin/start-postfix.sh

ENTRYPOINT [ "/sbin/start-postfix.sh" ]

