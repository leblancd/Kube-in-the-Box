# conKube
Utility for creating (possibly multiple) containerized, multi-node Kubernetes cluster(s) on a single host

# Installation

```
cd
git clone https://github.com/leblancd/conKube.git
```

# Creating Kubernetes Clusters
## Creating First Cluster
```
cd ~/conKube
./cluster_up_1.sh
```
After creating a multi-node, containerized cluster, the script will leave you in a shell. From this shell, you can run kubectl commands or 'docker exec ...' into the Kubernetes node containers.

## Creating Second Cluster
If desired, a second cluster can be created, in a separate window:
```
cd ~/conKube
./cluster_up_2.sh
```
Similar to the creation of the first cluster, the script will
leave you in a shell. From this shell, you can run kubectl commands or 'docker exec ...' into the Kubernetes node containers.

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

