#!/bin/bash

# Build the Docker image
docker-compose build

# Start the containers
docker-compose up -d