FROM ubuntu:xenial
LABEL maintainer="Sterling Hanenkamp \"sterling@hanenkamp.com\""

COPY start-postfix.sh /sbin/start-postfix.sh

RUN apt-get update \
    && apt-get -y install postfix

ENTRYPOINT [ "/sbin/start-postfix.sh" ]

