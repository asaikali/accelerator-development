## Validate access to the running Accelerator Portal 

Open the application accelerator running on PoC Kubernetes cluster

```dashboard:create-dashboard
name: Accelerator
url: http://20.42.34.233/dashboard/
```

Click around the accelerator GUI, in the next section of the workshop 
we will register a new accelerator, but first we need to configure 
`kubectl` to be able to access the PoC Kubernetes cluster running the **Accelerator Portal**.

## Configure access to Kubernetes PoC cluster 

You will need replace the content of the `~/.kube/config` file with the 
configuration to access the PoC Kubernetes culster.  

```editor:open-file
file: .kube/config 
```

**Replace the content of the file with the one provided over the chat**

Check the access to the cluster by executing the command in Terminal:

```execute
kubectl cluster-info
```

You should output similar to the one below, indicating you are connected 
to the PoC Kubernetes cluster

```text
Kubernetes control plane is running at https://tanzuclust-morganstanleypoc-267ba7-144ebf6b.hcp.eastus.azmk8s.io:443
CoreDNS is running at https://tanzuclust-morganstanleypoc-267ba7-144ebf6b.hcp.eastus.azmk8s.io:443/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy
Metrics-server is running at https://tanzuclust-morganstanleypoc-267ba7-144ebf6b.hcp.eastus.azmk8s.io:443/api/v1/namespaces/kube-system/services/https:metrics-server:/proxy

```

## Get a list of deployed accelerators 

Set the deafult namespace for the `kubectl` CLI
```execute
kubectl config set-context --current --namespace=default
```

The accelerators are registered using a custom Kubernetes CRD, so you can get a
list of all the CRDs using the command:

```execute
kubectl get accelerators
```

You should see output similar to the one below 

```text
NAME                         READY   REASON   AGE
example-spring-accelerator   True             21d
hello-fun                    True             27d
hello-ytt                    True             27d
node-express                 True             27d
spring-petclinic             True             27d
spring-sql-jpa               True             27d
tanzu-dotnet-webapi          True             22d
tanzu-java-web-app           True             27d
weatherforecast-csharp       True             27d
weatherforecast-fsharp       True             27d
weatherforecast-steeltoe     True             27d
```

