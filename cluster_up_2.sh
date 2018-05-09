#!/bin/bash
# Copyright 2018 Cisco Systems
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -o nounset

DOCKER_NETWORK_CIDR=172.62.0.0/16
DOCKER_NETWORK_NAME=k8s-cluster-net-2
export IP_MODE=ipv4
export DOCKER_HOST_IP=172.62.0.2
export DOCKER_HOST_PORT=2375
export DIND_SUBNET=10.193.0.0
export DIND_SUBNET_SIZE=16
export POD_NETWORK_CIDR=10.245.0.0/16
export REMOTE_DNS64_V4SERVER=173.37.87.157
DIND_CONTAINER_NAME=dind-2
CONKUBE_CONTAINER_NAME=k8s-cluster-2
DOCKER_IMAGE=diverdane/conkube

# Create a user defined network
echo Creating docker network
docker network create --subnet ${DOCKER_NETWORK_CIDR} ${DOCKER_NETWORK_NAME}

# Run a DinD container running a docker daemon on the user defined network
echo Running DinD container
docker run --privileged --rm --network ${DOCKER_NETWORK_NAME} --name ${DIND_CONTAINER_NAME} --sysctl net.ipv6.conf.all.disable_ipv6=0 -d docker:stable-dind --bip=172.20.0.1/16

# Run a container that will run Kubeadm-DinD-Cluster scripts to spin up
# a virtualized, multi-node Kubernetes cluster.
echo Running a conKube \(containerized Kubernetes cluster\) container

docker run -it --privileged --rm \
    --network ${DOCKER_NETWORK_NAME} --name ${CONKUBE_CONTAINER_NAME} \
    --cap-add=ALL -v /lib/modules:/lib/modules \
    -e IP_MODE \
    -e DOCKER_HOST_IP \
    -e DOCKER_HOST_PORT \
    -e DIND_SUBNET \
    -e DIND_SUBNET_SIZE \
    -e POD_NETWORK_CIDR \
    -e REMOTE_DNS64_V4SERVER \
${DOCKER_IMAGE}

