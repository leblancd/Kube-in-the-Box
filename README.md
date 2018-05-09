# conKube
Utility for creating (possibly multiple) containerized, multi-node Kubernetes cluster(s) on a single host

# Simplest Way to Create Kubernetes Clusters
This repo provides a few canned setup scripts that can be used to spin up Kubernetes clusters with a predetermined topology.
The simplest way to spin up a Kubernetes cluster on your host is to curl one of these scripts and run it on a single command line, e.g.:
```
cd ~/temp && curl -L https://raw.githubusercontent.com/leblancd/conKube/master/cluster_up_1.sh > cluster_up_1.sh && chmod +x cluster_up_1.sh && ./cluster_up_1.sh
```
This script will set you in a shell script running in a container, from which you can run kubectl commands and/or 'docker exec ...' into your Kubernetes node containers.

To set up a second cluster, run the following in a separate window:
```
cd ~/temp && curl -L https://raw.githubusercontent.com/leblancd/conKube/master/cluster_up_2.sh > cluster_up_2.sh && chmod +x cluster_up_2.sh && ./cluster_up_2.sh
```

Another way to run the canned setup scripts would be to clone this repo:
```
cd
git clone https://github.com/leblancd/conKube.git
cd conKube
```
and then run the canned setup scripts from the clone repo tree. 

# Cleaning Up
After exiting the shell scripts, you can kill the associated DinD container for the cluster, and remove the Docker network that was created for this cluster using the clean cluster scripts.
For example, to clean up after cluster 1:
```
cd ~/conKube
./clean_cluster_1.sh
```
and to clean up after cluster 2:
```
cd ~/conKube
./clean_cluster_2.sh
```
# IPv6 Support
IPv6 clusters are supported. Documentation and canned scripts will be provided shortly.

