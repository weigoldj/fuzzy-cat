
# Docker

## Docker Notes

docker images / containers.

## CONTAINERS
Build a Container
docker build -f <file> -t "<company/app>:<ver><minor>.<patch>" .

docker ps -a     # list all containers
docker ps -l     # list lastest container
docker attach <container>  # attach to a container using the container id.
docker rm $(docker ps -a -q)
docker rm $(docker kill $(docker ps -aq))  # kill containers and remove

## IMAGES
docker images --all   # list all images
docker images java    # list java images
docker rmi the_image  # remove a single image (-f to force)
docker rmi $(docker images -qf "dangling=true") # remove all images

## RUN
Run the Built container in interactive mode
docker run -t -i <container> /bin/bash
docker run -t -i <container>:<version> /bin/bash
docker stop $(docker ps -a -q)
