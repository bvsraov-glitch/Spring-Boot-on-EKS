#!/bin/bash
set -e

# Kill any process running on port 8080
lsof -ti:8080 | xargs -r kill

# Build the Spring Boot JAR
cd SpringBootOnEKS
mvn clean package

# Build the Docker image
cd ..
docker build -t springbootoneks:latest SpringBootOnEKS

echo "Spring Boot Docker image built successfully. Run with:"
echo "docker run -p 8080:8080 springbootoneks:latest"
