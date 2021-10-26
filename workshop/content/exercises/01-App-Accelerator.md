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



