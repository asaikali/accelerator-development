## Register an accelerator 

You will need a github account to complete this step. 

### fork the sample code repo 
Open the repo below and fork it into your personal github account 
```url
https://github.com/adib-samples/example-spring-accelerator
```

clone the git repo you have 
``` execute 
git clone url-to-your-cloned-repo
```

## define Accelerator CRD file 

Create a file called `reg.yaml` 

 ```editor:create-file
file: example-spring-accelerator/reg.yaml
```

Copy and past the yaml below into the `reg.yaml` file 

```copy
apiVersion: accelerator.apps.tanzu.vmware.com/v1alpha1
kind: Accelerator
metadata:
  name: 
spec:
  git:
    url: 
    interval: 10s
    ref:
      branch: main
```
## 

set the name of the accelerator to be the same as your github id, for 
example my github user id is `asaikali` so the Accelerator name will be 
`asaikali` and set the url to point to the git repo you forked earlier 

# Register the accelerator 

```execute
kubectl apply -f example-spring-accelerator/reg.yaml
```