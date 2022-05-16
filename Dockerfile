# syntax=docker/dockerfile:1
FROM resystit/bind9:latest
MAINTAINER Felipe Volpato 
ARG rede
ENV env_rede=$rede
WORKDIR /etc/bind
COPY XX.16.172.in-addr.arpa /etc/bind/${env_rede}.16.172.in-addr.arpa
COPY XX-db.cti /etc/bind/db.cti
RUN sed -i "s/XX/$env_rede/g" db.cti  
COPY XX-named.conf /etc/bind/named.conf
RUN sed -i "s/XX/$env_rede/g" named.conf  
EXPOSE 53/udp 
