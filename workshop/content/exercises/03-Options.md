## Define Accelerator YAML

The Application Accelerator looks for a file called `accelerator.yaml` at the root
of the git repo that was referenced from the `reg.yaml` you created in the previous
steup. `accelerator.yaml` defines all the options that users can set on the accelerator
along with transformation rules to apply to the git repo that is source of the accelerator.

Using the integrated vscode editor create a file  `example-spring-accelerator/accelerator.yaml` 

# define metadata for the accelerator 

copy and paste the content below into the `accelerator.yaml` file 

```copy
accelerator:
  displayName: ACME Inc. Spring Web Application
  description: An example starting template for offical spring web application at ACME Inc.
  iconUrl: https://raw.githubusercontent.com/sample-accelerators/icons/master/icon-cloud.png
  tags:
    - Java
    - Spring
    - Web
    - JPA
    - Test Patterns
```

add the file to git and commit it 

```execute 
git -C ~/example-spring-accelerator add -A && commit -m "add accelerator.yaml~ && git push
```
