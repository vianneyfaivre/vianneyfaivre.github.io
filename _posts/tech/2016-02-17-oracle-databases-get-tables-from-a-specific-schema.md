---
layout: post
title: "Oracle databases: Get tables from a specific schema"
categories: [tech]
---
Below is just a simple query to get all tables from a schema from an Oracle database.

{% highlight sql %}
SELECT TABLE_NAME 
FROM ALL_TABLES 
WHERE OWNER='MY_SCHEMA';
{% endhighlight %}
