# Docker

------

## Install

```bash
sudo apt install docker.io
sudo systemctl enable docker     # enable docker at boot
sudo systemctl disable docker    # disable docker at boot

sudo groupadd docker             # create group docker
sudo usermod -aG docker $USER    # add user to the docker group$
```

## Useful commands

* **Image:** Executable containing everything needed to run the code, i.e. code, runtime, libraries, env variables, config files

* **Container:** Runtime instance of an image

* **Dockerfile:** Rules explaining how to build the docker image. similar to bash scripts

```bash
docker --version                                    # check version
docker info                                         # info
docker image ls -a                                  # list images
docker container ls -a                              # list containers
docker service ls                                   # List services
docker run {image}                                  # run a container
docker run --publish 8000:80 --detatch --name aliasI {image}
# --publish  ->  forward host's port 8000 to container's port 80
# --detatch  ->  run in background
# --name     ->  specify a name with which you can refer to the image
docker build --tag=tagname:v1 path/to/Dockerfile    # build the image
docker build -t tgn:v2 docker/file context/path     # context=project
docker container stop containerName/ID              # for windows systems
docker rm --force containerName                     # delete container
# --force    ->  if the container is running, stop it
```

## Dockerfile

```sh
# Use the official image as a parent image.
FROM node:current-slim

# Set the working directory.
WORKDIR /usr/src/app

# Copy the file from your host to your current location.
COPY package.json .

# Run the command inside your image filesystem.
RUN npm install

# Inform Docker that the container is listening on the specified port at runtime.
EXPOSE 8080

# Copy the rest of your app's source code from your host to your image filesystem.
COPY . .

# Run the specified command within the container.
CMD [ "npm", "start" ]
```

## Layers

* A layer is a change in image. Every line in dockerfile is a layer. It's like git commit, every committed change is a layer.
* Number of layers increases size of image. so reduce number of layers
* only `RUN`, `COPY`, `ADD` adds layers to the image, other instructions create temporary intermediate images.
* Whenever possible use multistage builds to minimize no of layers

```sh
FROM ubuntu as sample   #This has its own number of layers say "X"
MAINTAINER FOO          #This is layer1
RUN mkdir /tmp/foo      #This is layer2
RUN apt-get install vim #This is layer3
```

## Multi-stage build

```sh
# Go app example
FROM golang:1.11-alpine AS build
# Run `docker build --no-cache .` to update dependencies
RUN apk add --no-cache git
RUN go get github.com/golang/dep/cmd/dep
# These layers are only re-built when Gopkg files are updated
COPY Gopkg.lock Gopkg.toml /go/src/project/
WORKDIR /go/src/project/
RUN dep ensure -vendor-only
# This layer is rebuilt when a file changes in the project directory
COPY . /go/src/project/
RUN go build -o /bin/project

# This results in a single layer image
FROM scratch
COPY --from=build /bin/project /bin/project
ENTRYPOINT ["/bin/project"]
CMD ["--help"]
```

### Dockerfile instructions / commands

```
FROM      :   basis of our image
LABEL     :   add labels in our image # LABEL com.example.version="1.0.0-beta" \
                                              vendor="Surjit Enterprises"
RUN       :   run shell commands # RUN apt update && apt install -y \
                                            curl \
                                            python3
CMD       :   run software contained in our image

```

## Sharing Containers across the servers

Registry: A collection of Repositories (an account basically)  
Repository: A collection of images (only one repository for free)

1. Create a docker id and login in docker CLI (https://hub.docker.com/)
2. Tag your images
3. Push your images (Publish)
4. Go to the server and run the image

```bash
docker login                                        # login to docker registry
docker tag ImageName username/repository:tag        # tag is optional, but docker uses it for version control
docker tag demo surjitsizzler/repo:ver1             # example
docker push username/repository:tag                 # publish
docker run -p 4000:80 username/repository:tag       # run on another machine
```

## Services (Docker-compose.yml)

* In a distributed application, diff pieces of the app are called services
* One service runs one container
* defines on what port, how many replicas of the container should run
* Scaling a service changes the no of container instances running that piece of software and assigns more computing power to the service in the process.
* containers inside a service are called task

To create service create a file named `docker-compose.yml`

```yaml
version: "3"  # depends on docker version (https://docs.docker.com/compose/compose-file/)
services:
  web:
    # replace username/repo:tag with your name and image details
    image: username/repo:tag
    deploy:
      replicas: 5
      resources:
        limits:
          cpus: "0.1"  # 10% of 1 core, 1.5-> 1.5 cores per instance
          memory: 50M
      restart_policy:
        condition: on-failure
    ports:
      - "4000:80"    # redirect host's 4000 to docker's 80
    networks:
      - webnet   # clustering internal network
networks:
  webnet:    # cluster config(empty: use defaults)
```

```bash
# initialize swarm for clustering
docker swarm init
# deploy the app
docker stack deploy -c docker-compose.yml a_name_for_the_app
```

```bash
docker service ls -a                # list all the services
docker service ps app_name          # list all the containers of that service(tasks)
docker container ls -q              # list ids of containers

docker stack rm app_name            # shutdown the app
docker swarm leave --force          # shutdown swarm
```

**Swarm**
A swarm is a group of machines(nodes) that are running docker and joined in a cluster.

```bash
docker swarm init           # create swarm manager
docker swarm join           # join a swarm cluter
docker node ls							# list all the nodes in a swarm
```

for testing create docker VMs

```bash
docker-machine create --driver virtualbox vm1
docker-machine create --driver virtualbox vm2
sudo docker-machine ls                                # display IP of machines
```

communicate with VMs

```bash
docker-machine ssh vm1 "docker swarm init --advertise-addr {vm1 ip}"
swarm initialized: current node {node id} is now a manager.

To add a worker to this swarm, run the following command:

  docker swarm join \
  --token <token> \
  <vm ip>:<port>

To add a manager to this swarm, run 'docker swarm join-token manager' and follow the instructions.

docke-machine ssh vm1 "docker swarm init --advertise-addr {vm1-IP}"		# create swarm manager
docker swarm join --token {token} {vm1-ip}:{port}											# join a machine in the swarm
docker-machine ssh vm1 "docker node ls"																# list all the nodes in swarm
```

create swarm manager with `docke-machine ssh vm1 "docker swarm init --advertise-addr {vm1-IP}"` cause machine has many IP address so explicitly provide IP address with `--advertise-addr` 
Out put will be `docker swarm join --token {token} {vm1-ip}:{port}` use it to join other VMs to swarm.

> Only swarm managers can execute docker commands, workers are just for capacity

