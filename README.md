# dnsfogxx

*A simple multi DNS docker composition/image configuration using BIND9*

The main purpose of this code is to make it possible to create several instances of bind9, each one responding to a specific network. Initially, the objective was to make the DNS pointing of the FOG image server for each specific network, avoiding the need for routing and considering that the FOG server has an interface in each specific network.

<img src="https://gitlab.isc.org/uploads/-/system/project/avatar/1/Bind_9_Mark_ISC_Blue.png?width=64"/>

# Usage

First you need to setup the corresponding networks for docker, i.e.:

```
docker network create -d bridge -o com.docker.network.bridge.host_binding_ipv4=172.16.82.9 rede-82

docker network create -d bridge -o com.docker.network.bridge.host_binding_ipv4=172.16.83.9 rede-83

docker network create -d bridge -o com.docker.network.bridge.host_binding_ipv4=172.16.84.9 rede-84

etc..
```

Then, you need to define your docker compose file with your requirements (use the docker-compose.yml file from this project as a start). In this example we are creating three containers wich one linked with a specific network interface defined before, i.e:

```
services:
        dns82:  
                container_name: rede-teste-82
                build: 
                        context: .
                        dockerfile: Dockerfile
                        args:
                          network: 172.16.82
                          zone: cti           
                ports:
                        - 53:53/tcp
                        - 53:53/udp
                networks:
                        - rede-82
        
        dns83:  
                container_name: rede-teste-83
                build: 
                        context: .
                        dockerfile: Dockerfile 
                        args:
                          network: 172.16.83
                          zone: cti                
                ports:
                        - 53:53/tcp
                        - 53:53/udp
                networks:
                        - rede-83
        dns84:  
                container_name: rede-teste-84
                build: 
                        context: .
                        dockerfile: Dockerfile 
                        args:
                          network: 172.16.84
                          zone: cti
                ports:
                        - 53:53/tcp
                        - 53:53/udp
                networks:
                        - rede-84

networks:
    rede-82:
      external: true 
    rede-83:
      external: true 
    rede-84:
      external: true 

```



In the next step you need to build your docker compose with your requirements, i.e:

```
docker compose build --no-cache
```

Finally, start the containers:

```
docker compose up
```

