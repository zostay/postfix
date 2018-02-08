FROM ubuntu:xenial
LABEL maintainer="Sterling Hanenkamp \"sterling@hanenkamp.com\""

RUN apt-get update \
    && apt-get -y install postfix syslog-ng \
    && mkdir -p /etc/postfix.overrides \
    && sed -i 's/#SYSLOGNG_OPTS="--no-caps"/SYSLOGNG_OPTS="--no-caps"/' /etc/default/syslog-ng \
    && sed -i 's/system();/#system();/' /etc/syslog-ng/syslog-ng.conf

COPY start-postfix.sh /sbin/start-postfix.sh

ENTRYPOINT [ "/sbin/start-postfix.sh" ]

