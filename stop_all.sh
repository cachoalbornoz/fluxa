clear

# Inicio de contenedores 

cd ~/Documentos/fluxa/mariadb/ && docker-compose down && cd ..
cd ~/Documentos/fluxa/apache/ && docker-compose down && cd ..

set -v

docker ps --format "table {{.Names}}\t{{.Ports}}\t{{.Status}}"
