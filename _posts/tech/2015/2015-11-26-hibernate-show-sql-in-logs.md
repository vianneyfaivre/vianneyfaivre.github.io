---
layout: post
title: "Hibernate: how to show SQL in logs"
categories: [tech]
---
When debugging it could be useful to see what are the queries Hibernate executes. To do so there are some ways of enabling debug logging:
<!--more-->

<h3>Using Log4J configuration</h3>

{% highlight properties %}
log4j.logger.org.hibernate.SQL=DEBUG
{% endhighlight %}

(in Liferay: you can change it from the admin panel without restarting the server)

<h3>Modifying Hibernate XML configuration</h3>

You need to change the factory bean that handles Hibernate sessions (a subclass of LocalSessionFactoryBean).

{% highlight xml %}
<property name="hibernateProperties">
  <props>
    <property name="show_sql">true</property> 
    <property name="format_sql">true</property> 
    <property name="use_sql_comments">true</property>
  </props>
</property>
{% endhighlight %}
