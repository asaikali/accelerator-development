## Register an accelerator 

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