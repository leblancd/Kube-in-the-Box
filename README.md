# Kube-in-the-Box
Kube-in-the-Box is a utility for creating one or more containerized, multi-node Kubernetes cluster(s) on a single host. It is based on the Kubernetes Kubeadm DinD Cluster (K-D-C), and works by spinning up each K-D-C cluster in its own DinD container (i.e. in a Docker-in-Docker-in-Docker, or DinDinD configuration). 

# Creating a Containerized, Multi-Node Cluster: All you need is docker and a script!
This repo provides a few canned setup scripts that can be used to spin up Kubernetes clusters with a predetermined topology.
The simplest way to spin up a Kubernetes cluster on your host is to curl one of these scripts and run it on a single command line, e.g.:
```
cd ~/temp && curl -L https://raw.githubusercontent.com/leblancd/kube-in-the-box/master/cluster_up_1.sh > cluster_up_1.sh && chmod +x cluster_up_1.sh && ./cluster_up_1.sh
```
This script will set you in a shell script running in a container, from which you can run kubectl commands and/or 'docker exec ...' into your Kubernetes node containers.

To set up a second cluster, run the following in a separate window:
```
cd ~/temp && curl -L https://raw.githubusercontent.com/leblancd/kube-in-the-box/master/cluster_up_2.sh > cluster_up_2.sh && chmod +x cluster_up_2.sh && ./cluster_up_2.sh
```

Another way to run the canned setup scripts would be to clone this repo:
```
cd
git clone https://github.com/leblancd/kube-in-the-box.git
cd kube-in-the-box
```
and then run the canned setup scripts from the clone repo tree. 

# Cleaning Up
After exiting the canned startup shell scripts, you can kill the associated DinD containers for the clusters and remove the Docker networks that were created for the clusters using the associated clean cluster scripts.
For example, to clean up after clusters 1 and 2  by curling the cleanup scripts from this repo:
```
cd ~/temp && curl -L https://raw.githubusercontent.com/leblancd/kube-in-the-box/master/clean_cluster_1.sh > clean_cluster_1.sh && chmod +x clean_cluster_1.sh && ./clean_cluster_1.sh
cd ~/temp && curl -L https://raw.githubusercontent.com/leblancd/kube-in-the-box/master/clean_cluster_2.sh > clean_cluster_2.sh && chmod +x clean_cluster_2.sh && ./clean_cluster_2.sh
```
Or, if you have a cloned copy of this repo, run the cleanup scripts directly:
```
cd ~/kube-in-the-box
./clean_cluster_1.sh
./clean_cluster_2.sh
```

# IPv6 Support
IPv6 clusters are supported. Documentation and canned scripts will be provided shortly.

