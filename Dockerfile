FROM tozd/postfix

LABEL maintainer="Sterling Hanenkamp \"sterling@hanenkamp.com\""

RUN mkdir -p /etc/postfix.overrides

COPY run.config /etc/service/postfix/run.config
