clear

echo "Servicios redes Docker"
# Crear red 
# docker network create fluxa-network

NETWORK="fluxa-network"
if docker network inspect ${NETWORK} > /dev/null 2>&1
then
    echo "Red '${NETWORK}' ya fue creada"
else
    echo "Network '${NETWORK}' no existe; creandola ..."
    docker network create ${NETWORK} > /dev/null
fi

# Inicio de contenedores 

echo "Servicio contenedores Docker"

cd ~/Documentos/fluxa/mariadb/ && docker-compose up -d --force-recreate --remove-orphans && cd ..
cd ~/Documentos/fluxa/apache/ && docker-compose up -d --force-recreate --remove-orphans && cd ..

clear

echo "Contenedores iniciados"

set -v

docker ps --format "table {{.Names}}\t{{.Ports}}\t{{.Status}}"