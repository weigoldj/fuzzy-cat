# DOCKER

## Links
landscape.cncf.io
store.docker.com
https://www.docker.com/products/docker-desktop
git clone https://github.com/BretFisher/udemy-docker-mastery.git 

https://labs.play-with-docker.com/
https://hub.docker.com

https://labs.play-with-k8s.com/


## Definitions
Image = is the binaries, source code libraries
container = is a running instance.
	    or is simply a process that runs on your machine

## docker commands
docker version 
docker info

Alot has been added to docker so a new manangenent structure command has 
been added to help classify commands.
docker <management cmd> <sub cmd> (options)
example: docker container run

## Containers

Container With ngnix
docker container run --publish 80:80 nginx
Note: if running on play with docker select open port to see 
the server running.

Run the container in the backgound using --detach, you will 
get back the unique hash id of the container.  Each time you 
run a container you get a unique id.  The port 80:80, the left 
side is the host port the right side is the port inside the container
docker container run --publish 80:80 --detach nginx  

docker container run --publish 80:80 --detach --name webhost nginx  
docker container logs webhost 
docker container top webhost
docker container --help
docker container rm -f 

Whats docker doing? Given the following command
docker container run --publish 80:80 -name webhost -d nginx:lates nginx -T
* looks fo the image locally in hte image cache
* looks in remote image repositry (docker hub)
* downloads latest version by default.  (nginx:latest)
* creates a new container based on teh image.
* gives it a virtual ip on a private network inside docker engine
* opes up port 80 and forwards to port 80 in container
* starts container using the cmd in the docker image file.



## Run Three Containers (nginx, httpd, mysql)
docker container run --publish 80:80 --detach --name proxy nginx
docker container run --publish 8080:80 --detach --name webhost httpd
docker container run --publish 3306:3306 --detach --name db -e MYSQL_RANDOM_ROOT_PASSWORD=yes

curl localhost => give back nginx return
curl localhost:8080 => gives httpd response

# list local images
docker image ls

# Container monitoring
docker container top - process listin one container
docker conatiner inspect - details of one container config
docker container stats - performance stats for all containers

# Container Shell
docker container run -it # interactivce pseudu tty
docker container exec -it # run additional command in existing container

docker conatainer start -ai  # attach interactively

# Container Network
* The "bridge" is the default private virtual network in docker.
* Two containers can talk to each other without exposing the port 
on the host using the -p command.
* You can create multiple networks that contain different containers. 
** containers on the same network can talk to each other.
** containers on different networks will need to talk thru exposed ports on the host.
** two containers on different networks cannot listed to the same port.

"batteries included but removable",

make new vitual network
 
## looking at ports
docker container run -p 80:80 --name webhost -d nginx
docker container port webhost
docker container inspect --format '{{ .NetworkSettings.IPAddress }}' webhost

# Networks
docker network ls               # show networks
docker network inspect          # inspect a network
docker network cteate --driver  # create a network
docker network connect          # attach a network to container
docker network disconnect       # detach a network from container

# Docker DNS
start a 2 container on a network
docker container run -d --name nginx_1 --network my-net nginx:alpine 
docker container run -d --name nginx_2 --network my-net nginx:alpine

Then do a exec from on of containers 
docker container exec -it nginx_1 ping nginx_2



# Persistent Data
Containers are immutable and ephemeral, or unchanging and disposable.
This design goal seperates the application from the data it might create, 
think db.

To persist data we use Volumes or Bind Mounts

VOLUME /var/lib/docker will mount a this directry in the container to a 
physical location on the host.  This location will outlive the container 
and require you to manually delete the data.

docker inspect <container>
docker volume ls
docker insepct <returned mount point>

even if you delete the containers the volumes still live.

Named volume  
-v mysql-db:/var/lib/mysql  

docker container run -d --name mysql -e MYSQL_ALLOW_EMPTY_PASSWORD=True -v mysql-db:/var/lib/mysql mysql

BIND MOUNT 
maps host file or directory to continer file or directory
need to be setup at runtime using -v
run -v /Users/mount:/path/container

# DB Upgrades Example
to find the volume mount look inside the docker file
 docker container run -d --name pg1 -v pg-db:/var/lib/postgresql/data postgres:9.6.1
docker container ls
docker volume ls
docker logs pg1
docker container stop pg1

# Bind Mount Example 
docker container run -d --name jkl -p 8080:4000 -v $(pwd):/srv/jekyll jekyll/jekyll jekyll serve

docker run -v $(pwd):/site bretfisher/jekyll new .
$ docker run -p 8080:4000 -v $(pwd):/site bretfisher/jekyll-serve

## Docker compose
Two parts 1) yaml file that describes networks, containers volumes
	  2) docker-compose used for local dev/test automation

# Commands 
docker-compose up
docker-compose down

# Kubernetes
popular container orchestrator










