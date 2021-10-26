## Register an accelerator 

You will need a github account to complete this step. 

### fork the sample code repo 
Open the repo below and fork it into your personal github account 
```dashboard:open-url
url: https://github.com/adib-samples/example-spring-accelerator
```

clone the git repo you have 
``` execute 
git clone url-to-your-cloned-repo
```

## Define Accelerator CRD file 

Create a placeholder for Accelerator CRD file

``` execute 
touch example-spring-accelerator/reg.yaml
```

Use the integrated VSCode editor to create a file called `example-spring-accelerator/reg.yaml` in the cloned 
repo

Copy and past the yaml below into the `example-spring-accelerator/reg.yaml` file 

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

Submit the CRD to the AKS cluster 

```execute
kubectl apply -f example-spring-accelerator/reg.yaml
```

You sould output similar to the one below 
```text
accelerator.accelerator.apps.tanzu.vmware.com/asaikali created
```

Get the list of all accelerators 
```execute 
kubectl get accelerators 
``` 
You should see you accelerator in returned in output. For eaxmple the output 
belows the `asaikali` accelerator.

```text
NAME                         READY   REASON   AGE
asaikali                     True             88s
example-spring-accelerator   True             21d
hello-fun                    True             27d
hello-ytt                    True             27d
node-express                 True             27d
spring-petclinic             True             27d
spring-sql-jpa               True             27d
tanzu-dotnet-webapi          True             23d
tanzu-java-web-app           True             27d
weatherforecast-csharp       True             27d
weatherforecast-fsharp       True             27d
weatherforecast-steeltoe     True             27d
```

Open the Accelerator portal and you should be able to see your accelerator 
listed in the list of avilable acceleartor.
```dashboard:open-url
url: http://20.42.34.233/dashboard/
```

One you click on your accelerator try the "Explore files button" and also 
Genearte and downoald a project. Notice that the downloaded zip file matches
the accelerator name. 

In the next step we will add options to acceleartor by creating an 
`accelerator.yaml` file with metadat will be used by the poratl.
