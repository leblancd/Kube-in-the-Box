# Copyright 2018 The Kubernetes Authors.
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

FROM gcr.io/k8s-testimages/kubekins-e2e:v20180102-0e2b24a0b-master
LABEL maintainer "leblancd@cisco.com"

# make systemd behave correctly in Docker container
# (e.g. accept systemd.setenv args, etc.)
ENV container docker

ENV ARCH amd64

env DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get -y install \
    aufs-tools \
    bind9 \
    bridge-utils \
    curl \
    cgroupfs-mount \
    dmsetup \
    ipcalc \
    iproute2 \
    iputils-ping \
    jq \
    kmod \
    liblz4-tool \
    net-tools \
    tcpdump \
    vim && \
    apt-get -y autoremove && \
    apt-get clean

EXPOSE 8080

# Install kubeadm-dind-cluster scripts
RUN cd /root && \
    git clone https://github.com/Mirantis/kubeadm-dind-cluster.git

#ENV SHELL bash
#ENV IP_MODE ipv4
#ENV REMOTE_DNS64_V4SERVER 173.37.87.157
#ENV DOCKER_HOST 172.62.0.2:2375

WORKDIR /workspace
ADD runner /
ENTRYPOINT ["/bin/bash", "/runner"]
