---
layout: post
title: "Maven - How to deploy artifacts to a Maven Repository"
categories: [tech]
---

To deploy a Java application code with source code and javadoc to a Maven Repository (like Nexus), you can use the following Maven command:

```
mvn deploy:deploy-file 
    -DgroupId=com.vianneyfaivre -DartifactId=your-artifact-id -Dversion=0.1 
    -DgeneratePom=true -Dpackaging=jar 
    -DrepositoryId=your-maven-repo 
    -Durl=https://your-maven-repo.com/repositories/releases 
    -Dfile=target/utility-raw-to-datahub-1.8.jar 
    -Dsources=target/utility-raw-to-datahub-1.8-sources.jar 
    -Djavadoc=target/utility-raw-to-datahub-1.8-javadoc.jar
```

The parameter `repositoryId` should be defined in the section `distributionManagement` of your project' `pom.xml` or in your `~/.m2/settings.xml`.

{% highlight xml %}
<distributionManagement>
    <repository>
        <id>your-maven-repo</id>
        <name>Your Maven Repository</name>
        <url>https://your-maven-repo.com/repositories/releases</url>
    </repository>
</distributionManagement>
{% endhighlight %}
 
More options are listed in Maven documentation: http://maven.apache.org/guides/mini/guide-3rd-party-jars-remote.html