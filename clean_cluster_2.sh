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

set -o errexit
set -o nounset
set -o pipefail
set -o errtrace

DIND_CONTAINER_NAME=dind-2
DOCKER_NETWORK_NAME=k8s-cluster-net-2

echo Killing DinD container
docker kill ${DIND_CONTAINER_NAME}
echo Removing user docker network
docker network rm ${DOCKER_NETWORK_NAME}

