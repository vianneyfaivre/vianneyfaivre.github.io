---
layout: post
title: "Liferay: Error 'Cache is not alive' when redeploying a portlet"
categories: [tech]
---
In your local environment, when re-deploying a portlet that uses Service Builder generated code, you might have the error "Cache is not alive" on your custom entities.

<!--more-->

To solve it, just add the following properties in your `portal-ext.properties` file. It will disable hibernate caching (do this on your local environment only).

{% highlight properties %}
hibernate.cache.use_query_cache=false
hibernate.cache.use_second_level_cache=false
hibernate.connection.isolation=4096
{% endhighlight %}
