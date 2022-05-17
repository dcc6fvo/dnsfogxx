# syntax=docker/dockerfile:1
FROM resystit/bind9:latest
MAINTAINER Felipe Volpato 
WORKDIR /etc/bind

ARG zone network
ENV env_zone=$zone env_net=$network

COPY ns/ZZ.YY.XX.in-addr.arpa /tmp/ZZ.YY.XX.in-addr.arpa
COPY ns/db.zone /tmp/db.zone
COPY ns/named.conf /tmp/named.conf
COPY ns/do-it-all.sh /tmp/do-it-all.sh

RUN chmod +x /tmp/do-it-all.sh
RUN /bin/sh /tmp/do-it-all.sh ${env_net} ${env_zone}

EXPOSE 53/udp 
