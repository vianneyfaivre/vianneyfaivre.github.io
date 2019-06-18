---
layout: post
title: "Docker Compose: Override configuration via an environment var"
categories: [tech]
---
Here is a simple way to override a variable in your docker-compose.yml file.

Using this syntax it will first try to get the environment variable named "MY_PROFILE" from your computer and pass it to the container, if it's not set, it will use the value "dev".

<!--more-->

<h3>docker-compose.yml</h3>

{% highlight yaml %}
 environment:
    - SPRING_PROFILES_ACTIVE=${MY_PROFILE-dev}
{% endhighlight %}

<h3>Environment variable "MY_PROFILE" not set</h3>

{% highlight shell %}
> docker-compose config
 environment:
    - SPRING_PROFILES_ACTIVE=dev
{% endhighlight %}

<h3>Environment variable "MY_PROFILE" set</h3>

{% highlight shell %}
> set MY_PROFILE=prod
> docker-compose config
 environment:
    - SPRING_PROFILES_ACTIVE=prod
{% endhighlight %}

<h3>Versions used</h3>

<ul>
<li>Docker: 17.06.0-ce</li>
<li>Docker Compose: 1.14.0</li>
<li>docker-compose.yml file format: 2.1</li>
<li>OS: Windows 10</li>
</ul>
