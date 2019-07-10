---
layout: post
title: "Jenkins Pipelines - How to load Groovy classes dynamically"
categories: [tech]
---

When using the Pipelines plugin, you may have noticed that all your pipeline logic must be in your Jenkinsfile.

If you want to split some of the stages in separated Groovy files, they won't be loaded when executing the Jenkinsfile as they are not in the Groovy classpath.

One way to solve that issue is to use [Jenkins Shared Library](https://jenkins.io/doc/book/pipeline/shared-libraries/) + @Library annotation in your code.

If you want to avoid sharing those classes to all the other pipelines, you can use the way described below.

## Jenkins Pipeline source code structure

Let's say you have a Pipeline "MyPipeline" committed in some Git repository and structured like that:

```
MyPipeline
+-- src
    +-- MyClass.groovy
+-- Jenkinsfile
```

What you want to do is make Jenkinsfile call methods inside MyClass.groovy

### Groovy class to load: src/MyClass.groovy

{% highlight groovy %}
print("Loaded class MyClass.groovy")

String testMethod() {
  return "OK!"
}

return this
{% endhighlight %}

### Main Pipeline Code: Jenkinsfile

{% highlight groovy %}
pipeline {
  agent { docker 'maven:3-alpine' } 
  stages {
    stage('Example Build') {
      steps {
        def MyClass = load "src/MyClass.groovy"
        print "Result " + MyClass.testMethod()
      }
    }
  }
}
{% endhighlight %}

## Test

Now try again to run the job where the pipeline "MyPipeline" is being used, and you should see in the logs:

```
Result OK!
```

One drawback of using that method is that you loose the IDE capabilities (autocompletion, error checking, ...) when writing the Jenkinsfile.

Tested with Jenkins 2.176.1