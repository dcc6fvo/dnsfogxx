# dnsfogxx

*A simple multi DNS docker image configuration using BIND9*

The main purpose of this code is to make it possible to create several instances of bind9, each one responding to a specific network. Initially, the objective was to make the DNS pointing of the FOG image server for each specific network, avoiding the need for routing and considering that the FOG server has an interface in each specific network.

<img src="https://gitlab.isc.org/uploads/-/system/project/avatar/1/Bind_9_Mark_ISC_Blue.png?width=64"/>

# Usage



```
docker run -p 8080:8080 -p 50000:50000 --restart always jenkins/jenkins:lts-jdk11
```
