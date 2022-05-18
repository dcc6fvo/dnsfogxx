# dnsfogxx

*A simple multi DNS docker composition/image configuration using BIND9*

The main purpose of this code is to make it possible to create several instances of bind9, each one responding to a specific network. Initially, the objective was to make the DNS pointing of the FOG image server for each specific network, avoiding the need for routing and considering that the FOG server has an interface in each specific network.

<img src="https://gitlab.isc.org/uploads/-/system/project/avatar/1/Bind_9_Mark_ISC_Blue.png?width=64"/>

# Usage

First you need to setup the corresponding networks, i.e.:

```
docker network create -d bridge -o       com.docker.network.bridge.host_binding_ipv4=172.16.80.9 rede-80

docker network create -d bridge -o       com.docker.network.bridge.host_binding_ipv4=172.16.81.9 rede-81

docker network create -d bridge -o       com.docker.network.bridge.host_binding_ipv4=172.16.82.9 rede-82

etc..
```
