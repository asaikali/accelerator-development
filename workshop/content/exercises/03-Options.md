## Define Accelerator YAML

The Application Accelerator looks for a file called `accelerator.yaml` at the root
of the git repo that was referenced from the `reg.yaml` you created in the previous
steup. `accelerator.yaml` defines all the options that users can set on the accelerator
along with transformation rules to apply to the git repo that is source of the accelerator.

### create the accelerator.yaml file 

In order to avoid having to log into yoru account from the integarted terminal 
the following steps should be done directly in the GitHub.com Web UI.

Create a file file at the root of the repo you froked in the previous step called
`accelerator.yaml` commit the empty file. 

### define metadata for the accelerator 

copy and paste the content below into the `accelerator.yaml` file using 
the github.com UI and set the display name to github userid. 

```copy-and-edit
accelerator:
  displayName: 
  description: An example starting template for a spring web app
  iconUrl: https://raw.githubusercontent.com/sample-accelerators/icons/master/icon-cloud.png
  tags:
    - Java
    - Spring
    - Web
    - JPA
    - Test Patterns
```

commit the changes on the github UI. 

refresh the accelerator dashboard

```dashboard:open-url
url: http://20.42.34.233/dashboard/
```

Your accelerator should now have a description, try finding your accelerator using the tags 
that you registered under in the `accelerator.yaml` file. 

### configure options for the Java JDK to use 

The `options` section of the `accelerator.yaml` is used to define a UI form
that will be used to prompt users for inputs to use when using 
the accelerator. The vaule of each option is made avilable inside a
variable that can be referenced from the transformation section 

copy and paste code snippet below into the `accelerator.yaml` and commit the changes.

```copy
  options:
    - name: javaVersion
      inputType: select
      dataType: string
      display: true
      required: true
      defaultValue: "11"
      choices:
        - text: 11 (Supported in Production)
          value: "11"
        - text: 17 (Production in Oct 2022, QA only for now)
          value: "17"
```

After commiting the changes, wait 10 seconds and refresh the
accelerator portal to see new drop down option in the UI. If you 
get an error message check that the YAML is formatted correctly.

### configure option for removing database support 

Add a toggle button for turning off the database support, by copying
and pasting the code snippet below into `accelerator.yaml` under
the optios key.

```copy
    - name: noDB
      label: Stateless (Don't need a database)
      inputType: toggle
      display: false
      dataType: boolean
      defaultValue: false
```
After commiting the changes, wait 10 seconds and refresh the
accelerator portal to see new drop down option in the UI. If you 
get an error message check that the YAML is formatted correctly.

### configure option for enabling sonar qube 

Lets add add option to configure the generated project to use 
sonarqube for static code analysis. We have two UI elements that 
we want to show, the first element is a toggle button that 
enable sonarquibe the second is an edit box that is used to 
set the name of the sonarqube project that analysis results 
shoud be sent to. The ability to configure conditional UI 
elements is one of the nice features of Application Accelerator.

copy and paste the code snippet below into the `accelerator.yaml`
under the options key. 

```copy 
    - name: sonar
      label: use sonarqube
      inputType: toggle
      display: true
      dataType: boolean
      defaultValue: false
    - name: projectKey
      label: Sonar project key
      dataType: string
      defaultValue: ''
      dependsOn:
        name: sonar
```

After commiting the changes, wait 10 seconds and refresh the
accelerator portal to see new drop down option in the UI. If you 
get an error message check that the YAML is formatted correctly.

### Summary 

In the `accelerator.yaml` we were able to define metadata 
about the accelerator so that it can be displayed by the portal.
We were also able to define a user interface to collect input
from the user and bind the input to variables in the next 
seciton we will configure transformations that will use the 
inputs collected by the UI to change the output of the 
accelerator. 

