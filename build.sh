#!/bin/bash

docker compose -f docker-compose.build.yaml build
docker image prune -f
