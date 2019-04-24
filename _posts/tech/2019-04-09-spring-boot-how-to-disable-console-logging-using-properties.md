---
layout: post
title: "Spring Boot: How to disable console logging using properties"
categories: [tech]
---
<!--more-->
<p>To disable console logging, add the following properties to application.properties file:</p>

{% highlight properties %}
# Empty this property to disable console logging
logging.pattern.console=

# Specify the path to the main log file so you will still have your logs somewhere
logging.file=/path/to/folder/application.log
{% endhighlight %}

<p>If you want to enable console logging in your IDE, here are two ways to re-enable it:</p>


<ul><li>Add an alias to the log file /path/to/folder/application.log in your Run Configuration</li><li>Override the property "logging.pattern.console" in your Run Configuration</li></ul>


<p>Tested with Spring Boot 2.1.4</p>