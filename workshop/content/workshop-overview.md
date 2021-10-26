This hands on tutorial walks you step by step through the process of 
writing a Tanzu Application accelerator. This interactive workshop
environment is running on a Kuberenetes cluster using the Tanzu Learning Center.

A starter git reposistory containing the Java opinions below is provided for you, so you can focus on learning how to write the accelerator configuration. 

* Organize git repo according to corporate recommendations 
* Gradle multi-module project 
    - Algin classpath dependency versions using a Gradle platform rather than the  Spring Boot Plugin 
    - Use the Java Application plugin to produce a fat jar rather than the Spring Boot Plugin 
    - Follow gradle best practices for organizing build logic
* Enforce a consistent code formatting style using check style &     spotless plugin 
    - Google Java Formatting Style
    - SQL formatting
    - Fail the build on code style violations 
* Can run complex integration tests after checkout without any external dependencies beyond docker 
    - Run browser based tests using Selenium and capture video recording of test execution 
    - On demand database / API integration tests that leverage test containers for test isolation and reproducibility 
* Tooling integrations 
    - GitHub actions pipeline
    - SonarQube integration 
* Allow developers to select 
    - Java version (11 or 17)
    - Database or no database 
