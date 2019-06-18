---
layout: post
title: "Runnable Spring Boot JAR + Docker: Enable JMX"
categories: [tech]
---
When you run a Spring Boot app in a Docker container, you can't access JMX endpoints using the basic config.

<!--more-->

Command to use to start your Spring Boot application inside your Docker container:

{% highlight shell %}
java \
-Djava.rmi.server.hostname=127.0.0.1 \
-Dcom.sun.management.jmxremote.port=8089 \
-Dcom.sun.management.jmxremote.rmi.port=8089 \
-Dcom.sun.management.jmxremote.ssl=false \
-Dcom.sun.management.jmxremote.authenticate=false \
-jar app.jar
{% endhighlight %}

Then you just have to map the port 8089 in a port of your host machine (let's say 8089), and you can access it via Visual VM at "localhost:8089".
