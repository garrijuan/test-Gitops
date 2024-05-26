#!/bin/bash

# Lee el entorno desde un argumento de línea de comandos o de alguna otra fuente
ENVIRONMENT=$1

# Lee las variables de configuración correspondientes al entorno
if [ "$ENVIRONMENT" == "dev" ]; then
  source ~/config-dev.env
elif [ "$ENVIRONMENT" == "pro" ]; then
  source ~/config-prod.env
else
  echo "Entorno no válido"
  exit 1
fi

# Reemplaza los marcadores de posición en la plantilla con los valores de configuración
sed "s|\${REPO}|$REPO|g; s|\${ENVIROMENT}|$ENVIROMENT|g" deployment.yaml.template > k8s/CD.yml

#sed "s|\${REPLICAS}|$REPLICAS|g; s|\${IMAGE}|$IMAGE|g" deployment.yaml.template > deployment.yaml

echo "Manifiesto CD.yml de despliegue generado para el entorno $ENVIRONMENT"
