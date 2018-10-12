# Kube-in-the-Box
Kube-in-the-Box is a utility for creating one or more containerized, multi-node Kubernetes cluster(s) on a single host. It is based on the Kubernetes Kubeadm DinD Cluster (K-D-C), and works by spinning up each K-D-C cluster in its own DinD container (i.e. in a Docker-in-Docker-in-Docker, or DinDinD configuration). 

# Creating a Containerized, Multi-Node Cluster: All you need is docker!

To spin up a containerized, multi-node cluster, run:
```
docker run --name ipv4_cluster_1 -it --privileged --tmpfs /docker-graph:exec diverdane/kube-in-the-box
```
To spin up a second, containerized, multi-node cluster, run:
```
docker run --name ipv4_cluster_2 -it --privileged --tmpfs /docker-graph:exec diverdane/kube-in-the-box
```
To spin up a containerized, multi-node cluster running in IPv6 mode, run:
```
docker run --name ipv6_cluster_1 -it --privileged -e "IP_MODE=ipv6" --tmpfs /docker-graph:exec diverdane/kube-in-the-box
```
If you're running in an environment that has a local DNS server:
```
docker run --name ipv6_cluster_2 -it --privileged -e "IP_MODE=ipv6" -e "REMOTE_DNS64_V4SERVER=<your-dns-ip-addr>" --tmpfs /docker-graph:exec diverdane/kube-in-the-box
```

