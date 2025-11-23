docker stop $(docker ps -q)

docker rm $(docker ps -a -q)

docker rmi -f $(docker images -q)

docker volume rm $(docker volume ls -q)

docker network prune -f
