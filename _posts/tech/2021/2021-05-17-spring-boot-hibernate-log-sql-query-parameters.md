---
layout: post
title: "Spring Boot + Hibernate: how to log SQL Query and Parameters"
categories: [tech]
---

Here is how to enable SQL query logging (query + parameters) with Spring Boot + Hibernate.

{% highlight properties %}
spring.jpa.show-sql=true
spring.jpa.properties.hibernate.format_sql=true

logging.level.org.hibernate.SQL=DEBUG
logging.level.org.springframework.transaction=TRACE
logging.level.org.hibernate.type.descriptor.sql=TRACE
{% endhighlight %}

Tested with Spring Boot `2.4.4` (Hibernate version is `5.4.29.Final`)
