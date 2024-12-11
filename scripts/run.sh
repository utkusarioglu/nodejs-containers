im=utkusarioglu/node-devcontainer:new-test2

docker image rm $im
docker pull $im
docker run -it --rm $im 
