## Register an accelerator 

You will need a github account to complete this step. 

Open the repo below and fork it into your personal github account 
```url
https://github.com/adib-samples/example-spring-accelerator
```

clone the git repo you have 
``` execute 
git clone url-to-your-cloned-repo
```

```copy
apiVersion: accelerator.apps.tanzu.vmware.com/v1alpha1
kind: Accelerator
metadata:
  name: example-spring-accelerator
spec:
  git:
    url: https://github.com/asaikali/example-spring-accelerator
    interval: 10s
    ref:
      branch: main
```
## 