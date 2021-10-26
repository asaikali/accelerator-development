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

# define metadata for the accelerator 

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

