---
layout: post
title: "Jenkins Pipelines - Use sshagent within a Docker container"
categories: [tech]
---

Even when using Docker inside your Jenkins pipeline you can still use the SSH Credentials defined in Jenkins.

Here is a sample Jenkins pipeline that creates a Node v12 Docker container and ssh into an external server.

It is using the [SSH Agent Plugin](http://wiki.jenkins-ci.org/display/JENKINS/SSH+Agent+Plugin) in Jenkins to copy the SSH Private Key into the Docker container .ssh folder.

First you have to create a Private Key and create the Credentials in Jenkins:

![Jenkins Credentials Configuration](/assets/images/posts/2019-09-28-jenkins-pipelines-sshagent-docker-container_1.png)

Then you can write the pipeline that spins up the Docker container and uses sshagent plugin:

{% highlight groovy %}
pipeline {

  agent {
    docker {
      image 'node:12-alpine'
    }
  }

  stages {
 
    stage('Test SSH inside a Docker container') {
     
      steps {
        sh "npm --version"

        sshagent (credentials: ['myuser-myserver-ssh-access']) {
          sh "ssh -vvv -o StrictHostKeyChecking=no -T myuser@myserver"
        }
      }
    }
  }
}
{% endhighlight %}


Tested with Jenkins 2.176.2 and [SSH Agent Plugin](http://wiki.jenkins-ci.org/display/JENKINS/SSH+Agent+Plugin) 1.17