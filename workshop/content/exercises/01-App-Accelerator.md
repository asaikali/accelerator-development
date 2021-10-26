# Environment Setup

## validate access to the runnig accelerator portal 

Open the application accelerator running on AKS cluster

```dashboard:create-dashboard
name: Accelerator
url: http://20.42.34.233/dashboard/
```
Click around the accelerator gui, in the next section of the workshop 
we will register a new accelerator, but first we need to configure 
`kubectl` to be able to access the AKS cluster running the accelerator.

## Configure access to AKS PoC cluster 

You will need replace the content of the `~/.kube/config` file with the 
configuration to access the AKS culster.  

```editor:open-file
file: .kube/config 
```

**replace the content of the file with the one provided over the chat**

execute the command

```execute
kubectl cluster-info
```

You should output similar to the one below, indicating you are connected 
to the PoC AKS cluster

```text
Kubernetes control plane is running at https://tanzuclust-morganstanleypoc-267ba7-144ebf6b.hcp.eastus.azmk8s.io:443
CoreDNS is running at https://tanzuclust-morganstanleypoc-267ba7-144ebf6b.hcp.eastus.azmk8s.io:443/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy
Metrics-server is running at https://tanzuclust-morganstanleypoc-267ba7-144ebf6b.hcp.eastus.azmk8s.io:443/api/v1/namespaces/kube-system/services/https:metrics-server:/proxy

```

## get a list of deployed accelerators 

Set the deafult namespace for the kubectl cli 
```execute
kubectl config set-context --current --namespace=default
```

The accelerators are registerd using a custom K8s CRD so you can get a
list of all the CRDs using the command.

```execute
kubectl config set-context --current --namespace=default
```