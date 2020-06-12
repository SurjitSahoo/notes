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

```docker
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
* **NOTE : Keeping COPY instruction at last ensures faster subsequent builds, because only project files will be changed and need rebuild, none of the above layers are changed. So the above layers can be cached.**

```docker
FROM ubuntu as sample   #This has its own number of layers say "X"
MAINTAINER FOO          #This is layer1
RUN mkdir /tmp/foo      #This is layer2
RUN apt-get install vim #This is layer3
```

## Multi-stage build

```docker
# Go app example
FROM golang:1.11-alpine AS base
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
# COPY --from=0 /bin/project /bin/project
COPY --from=base /bin/project /bin/project
ENTRYPOINT ["/bin/project"]
CMD ["--help"]
```

> Note: By default stages are not named, they can be refereed by their integer number stating with zero (0) for the first `FROM` instruction. Stages can be named by adding `AS` to the `FROM` instruction.

### You can use previous stage as new stage and pick up from where you left off.

```docker
FROM alpine:latest as builder
RUN apk --no-cache add build-base

FROM builder as build1
COPY source1.cpp source.cpp
RUN g++ -o /binary source.cpp
```

### Dockerfile instructions / commands

```docker
FROM  : basis of our image
FROM ubuntu

WORKDIR: working directory in container
WORKDIR /app/

LABEL : add labels in our image 
LABEL com.example.version="1.0.0-beta" \
      vendor="Surjit Enterprises"

RUN   : run shell commands
RUN apt update && apt install -y \
    curl \
    python3

CMD   : run software contained in our image
CMD ["python", "index.py", "arg1", "arg2"]

EXPOSE: port number for docker container to listen on
EXPOSE: 80

ENV   : set up environment variable for the application
ENV PATH /usr/local/nginx/bin:$PATH => ensures CMD ["nginx"] works

COPY  : copy files to image/container
COPY project/files  /working/directory/in/image

ADD   : similar to COPY with extra features like auto extraction of tar and remote url support
ADD files.tar.xz /app/src/files

ENTRYPOINT: allows to configure a container that will run as an executable.
ENTRYPOINT ["s3cmd"]
CMD ["--help"]
$ docker run s3cmd

VOLUME: storage area for any mutable data created by the container
```

# Docker-Compose

Compose is a tool for running multi-container docker applications.

* Define app's environment with a `Dockerfile`
* Define services that make up your app in `docker-compose.yml` so they can run together in an isolated env.
* Run `$ docker-compose up`

## Services (Docker-compose.yml)

* In a distributed application, diff pieces of the app are called services
* One service runs one container
* defines on what port, how many replicas of the container should run
* Scaling a service changes the no of container instances running that piece of software and assigns more computing power to the service in the process.
* containers inside a service are called task

To create service create a file named `docker-compose.yml`

Following sample file has two services, i.e. web and redis.

```yml
version: "3"  # depends on docker version
services:
  web:
    build: .  # use image built from Dockerfile in current directory
    volumes:
      - .: /code  # Mount project current directory on host to /code to edit code on the fly without rebuilding the image
    environment:
      FLASK_ENV: development # Run python flask in dev mode->auto reload the code on change
      - "constraint:node==node-1"
    deploy:
      replicas: 5   # deploy 5 copies of the service
      resources:
        limits:
          cpus: "0.1"  # 10% of 1 core, 1.5-> 1.5 cores per instance
          memory: 50M  # 50 MB
      restart_policy:
        condition: on-failure
    ports:
      - "4000:80"    # redirect host's 4000 to docker's 80
    networks:
      - webnet   # clustering internal network
  redis:
    image: "redis:alpine"
    environment:
      - "constraint:node==node-1" # making sure both the services end up in same node
networks:
  webnet:    # cluster config(empty: use defaults)
```

```bash
docker-compose up             # run the service(s)
docker-compose up -d          # run the service(s) in the background
docker-compose ps             # list running services
docker-compose run            # run a specific command for a service
docker-compose run web env    # list available env variable to the web service
docker-compose stop           # stop the service
docker-compose down           # take down the service(s) along with the containers(delete)
docker-compose down --volumes # stop services, delete containers, remove mounted volumes
docker-compose scale redis=3  # scale up redis(service) to 3 replicas
```

> Note: If the container is using port in a swarm -> if the image or compose file has defined volume without specific mapping, in order to preserve the volume data, docker will schedule all the containers to be created on the same node, which will result into port clash(error)

## Environment Variables

```sh
docker run -e VARIABLE=VALUE        # set env
docker run -e variable1 variable2   # pass existing variables
docker run --env-file=filename.env  # pass env variables defined in an external file
```

```yml
service1:
  environment:
    - DEBUG=1   # set env
    - DEBUG     # env is passed, the value will be searched

service2:
  env-file:
    - filename.env  # env variables are defined in this file
```

Alternatively we can use `.env` file to define all the env variables at once. It will be automatically picked up by docker compose.

```env
# .env
TAG=V 1.2
```

```yml
# docker-compose.yml
service1:
  environment:
    - TAG=${TAG}
```

#### Order of Precedence for resolving env variables

* compose-file
* Shell env variable
* .env file (environment file)
* Dockerfile
* undefined

> To check what are the resolved values of env variable, run `docker-compose config`

#### Multiple compose files
1. `docker-compose up` automatically takes `docker-compose.yml` file and `docker-compose.override.yml` and overrides the original compose file
2. We can pass compose files with `-f` flag to `docker-compose` to specifically tell which compose files to take.
3. **use case :** define compose files such as `docker-compose.yml`, `docker-compose.develop.yml` (development overrides / configurations) and `docker-compose.prod.yml` (production overrides / configurations)

## Compose in production

* Maintain a separate yml file for production configurations
* After making changes to code always rebuild the images

```sh
docker-compose build service1       # rebuild image for service1
docker-compose up --no-deps -d web  # --no-deps: don't touch dependency services
```

# Swarm

A swarm is a group of machines(nodes) that are running docker and joined in a cluster.

```bash
docker swarm init           # create swarm manager
docker swarm join           # join a swarm cluter
docker node ls              # list all the nodes in a swarm
```

for testing create docker VMs

```bash
docker-machine create --driver virtualbox vm1
docker-machine create --driver virtualbox vm2
sudo docker-machine ls       # display IP of machines
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


# Sharing Containers across the servers

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