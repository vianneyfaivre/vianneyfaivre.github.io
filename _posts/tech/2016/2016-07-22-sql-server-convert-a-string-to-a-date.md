---
layout: post
title: "SQL Server: convert a string to a date"
categories: [tech]
---
Simple but useful snippet for converting a string to a date using a specific locale in SQL Server:

{% highlight sql %}
TRY_PARSE('22/07/2016' AS DATETIME USING 'fr-fr')
{% endhighlight %}
