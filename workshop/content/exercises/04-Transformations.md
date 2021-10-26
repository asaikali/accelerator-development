## Configure Transformations 

To build the accelerator we wrote the code that expreses the 
opinioms that we want to share with deveolpers and placed the code
in a git repo. Then, we defined an `accelerator.yaml` file with
metadata to help users find the acceleartor and UI forms that 
enables users to set values and bind them to variables which
we will now use. 

Explore the docs for the accelerator transformations 

```dashboard:open-url
url: https://docs.vmware.com/en/Application-Accelerator-for-VMware-Tanzu/0.3/acc-docs/GUID-creating-accelerators-transform-intro.html
```

### Configure engine to select a subset of files from repo to transform

Copy and paste the content below into the `accelerator.yaml` file then commit the file

```copy
engine:
  merge:
    - include: [ "**/**" ]
      exclude: [ "reg.yaml", "components/database/**", "applications/**", "ytt/**" ]
```

The engine executes a series of transformations against the files in the 
git repo containing the code of the accelerator. In the configuration in the
code snippet we are including all the files in the repo and then execluding 
a set of files that we will conditionaly include in a series of transformations.

Refresh the accelerator page and click on the explore button notice that 
the excluded files don't show up in the generated output.

Make sure to look at the contents of the `accelerator-log.md` to see how the 
accelerator ran transformations on the git repo. 

### Set the Gradle project name

The `settings.gradle.kts` file contains the name of the project. We should 
set the Gradle project to match the artifactId entered by the user in the
accelerator UI.

Copy and paste the code snippet below into the `accelerator.yaml` 
as the child of the merge element you copy and pasted earlier.  

```copy
    - include: [ "settings.gradle.kts" ]
      chain:
        - type: ReplaceText
          substitutions:
            - text: example-spring-accelerator
              with: "#artifactId"
```

Commit your changes, then reload the accelerator page. Change the artifact id 
on click on the "EXPLORE FILEs" button then open the `settings.gradle.kts` file
and notice that the project name matches the value of the artifact id.
The `#artifactId` reference in the snippet above is a varabile reference.
The transformation engine uses Spring Expression Language to reference 
variables. 


### Conditionaly react to the Java version 

Copy and paste the snippet below into the `accelerator.yaml` as a child 
of the top level merge node. 

```copy
- condition: "#javaVersion == '17'"
      include: [ "buildSrc/src/main/kotlin/java-library-conventions.gradle.kts" ]
      chain:
        - type: ReplaceText
          substitutions:
            - text: JavaLanguageVersion.of(11)
              with: "'JavaLanguageVersion.of(17)'"
```

Commit the change and refresh the accelerator page. Change the Java language version
click on the "EXPLORE FILES" button and validate that the file 
`buildSrc/src/main/kotlin/java-library-conventions.gradle.kts` has the correct 
Java version. 


## Final configuration 

The code below shows the full configuration of the engine you can optionally
cut and paste it into the `acclerator.yaml` to enable all the transformations
associated with the UI. 

```copy
engine:
  merge:
    - include: [ "**/**" ]
      exclude: [ "reg.yaml", "components/database/**", "applications/**", "ytt/**" ]
    - include: [ "settings.gradle.kts" ]
      chain:
        - type: ReplaceText
          substitutions:
            - text: example-spring-accelerator
              with: "#artifactId"
    - condition: "#javaVersion == '17'"
      include: [ "buildSrc/src/main/kotlin/java-library-conventions.gradle.kts" ]
      chain:
        - type: ReplaceText
          substitutions:
            - text: JavaLanguageVersion.of(11)
              with: "'JavaLanguageVersion.of(17)'"
    - include: [ ".github/workflows/build.yml" ]
      chain:
        - type: ReplaceText
          condition: "#javaVersion == '17'"
          substitutions:
            - text: 11
              with: "'17'"
        - type: ReplaceText
          condition: "#sonar == false"
          substitutions:
            - text: sonarqube
              with: "''"
    - condition: "#noDB == true"
      include: [ "applications/billboard-stateless/**" ]
    - condition: "#noDB == false"
      include: [ "components/database/**", "applications/billboard/**" ]
    - include: [ "build.gradle.kts"]
      chain:
        - type: ReplaceText
          condition: "#sonar == true"
          substitutions:
            - text: asaikali_example-spring-accelerator
              with: "#projectKey"
        - type: ReplaceText
          condition: "#sonar == false"
          substitutions:
            - text: |
                sonarqube {
                    properties {
                        property("sonar.projectKey", "asaikali_example-spring-accelerator")
                        property("sonar.organization", "asaikali")
                        property("sonar.host.url", "https://sonarcloud.io")
                    }
                }
              with: "''"
```
