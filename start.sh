#!/bin/bash

# Script Name: start.sh
# Description: Start portainer and caddy reverse proxy
# Author: Tim
# Date Created: 2024-08-07
# Last Modified: 2024-08-07

# Set strict mode
set -euo pipefail

PATH_CADDY_DOCKER_COMPOSE_FILE="caddy/docker-compose.yml"
PATH_PORTAINER_DOCKER_COMPOSE_FILE="portainer/docker-compose.yml"

function startCaddy() {
  echo "starting caddy reverse proxy"
  docker-compose -f "$PATH_CADDY_DOCKER_COMPOSE_FILE" up -d
  echo "caddy reverse proxy started"
}

function startPortainer() {
  echo "starting portainer service"
  docker-compose -f "$PATH_PORTAINER_DOCKER_COMPOSE_FILE" up -d
  echo "portainer service started"
}

function main() {
    startCaddy
    startPortainer
}

main "$@"