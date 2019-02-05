#!/usr/bin/env bash
# Production environment: 178.22.69.83
# Private key for ssh: /opt/keypairs/ditas-testbed-keypair.pem

# TODO state management? We are killing without careing about any operation the conainer could be doing.

ssh -i /opt/keypairs/ditas-testbed-keypair.pem cloudsigma@178.22.69.83 << 'ENDSSH'
# Ensure that a previously running instance is stopped (-f stops and removes in a single step)
# || true - "docker stop" fails with exit status 1 if image doen't exists, what makes the Pipeline fail. the "|| true" forces the command to exit with 0
# Try a graceful stop: 20 seconds for SIGTERM and SIGKILL after that
sudo docker stop --time 20 IMAGE_NAME || true
sudo docker rm --force IMAGE_NAME || true
sudo docker pull ditas/IMAGE_NAME:production

# Get the host IP
HOST_IP="$(ip route get 8.8.8.8 | awk '{print $NF; exit}')"

# Run the docker mapping the ports and passing the host IP via the environmental variable "DOCKER_HOST_IP"
sudo docker run -p HOST_PORT:CONTAINER_PORT -e DOCKER_HOST_IP=$HOST_IP --restart unless-stopped -d --name IMAGE_NAME ditas/IMAGE_NAME:production
ENDSSH