clear

# Inicio de contenedor

cd ~/Documentos/fluxa/mariadb/ && docker-compose up -d --remove-orphans && cd ..

docker inspect -f '{{.Name}} - {{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $(docker ps -aq)

docker ps -a 
