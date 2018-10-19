# Kube-in-the-Box
Kube-in-the-Box is a container image that can be used to create one or more containerized, multi-node Kubernetes cluster(s) on a single host. It is based on:
- The Kubernetes [Kubeadm DinD Cluster (K-D-C) scripts](https://github.com/kubernetes-sigs/kubeadm-dind-cluster) scripts, and
- The Kubernetes test-infra [kubekins-e2e container](https://github.com/kubernetes/test-infra/tree/master/images/kubekins-e2e), which is based on the Kubernetes test-infra [bootstrap container](https://github.com/kubernetes/test-infra/tree/master/images/bootstrap)
It works by spinning up each K-D-C cluster in its own DinD container (i.e. in a Docker-in-Docker-in-Docker, or "DinDinD" configuration). 

# Creating a Containerized, Multi-Node Cluster: All you need is docker!

To spin up a containerized, multi-node cluster, run:
```
docker run --name ipv4_cluster_1 -it --privileged --rm --tmpfs /docker-graph:exec diverdane/kube-in-the-box
```
To spin up a second, containerized, multi-node cluster, run:
```
docker run --name ipv4_cluster_2 -it --privileged --rm --tmpfs /docker-graph:exec diverdane/kube-in-the-box
```
To spin up a containerized, multi-node cluster running in IPv6 mode, run:
```
docker run --name ipv6_cluster_1 -it --privileged -e "IP_MODE=ipv6" --rm --tmpfs /docker-graph:exec diverdane/kube-in-the-box
```
If you're running in an environment that has a local DNS server:
```
docker run --name ipv6_cluster_2 -it --privileged -e "IP_MODE=ipv6" -e "REMOTE_DNS64_V4SERVER=<your-dns-ip-addr>" --rm --tmpfs /docker-graph:exec diverdane/kube-in-the-box
```

# System Requirements
The following is required for the host on which you Docker run Kube-in-the-Box container:
- Docker version:  Version 1.12.6 or later
- System memory:   12 GBytes or greater
- Hard disk space: TBD (per cluster)

# Running On a VirtualBox VM
Kube-in-the-Box requires 12 GBytes of RAM on the host on which the Kube-in-the-Box container is being run. If you are Docker running Kube-in-the-Box containers on a VirtualBox VM, please make sure to set the VM's system memory size to at least 12 GBytes.

