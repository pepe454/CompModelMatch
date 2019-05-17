#!/bin/bash
read -p 'Container that is running: ' containerName
read -p 'Name of the image you would like to build: ' imageName
echo Note that you may need to change docker-compose.yml to deploy the correct image 
echo The container name will remain constant

docker commit $containerName $imageName
docker-compose down
docker-compose up -d

docker exec -it -u 0 $containerName bash
