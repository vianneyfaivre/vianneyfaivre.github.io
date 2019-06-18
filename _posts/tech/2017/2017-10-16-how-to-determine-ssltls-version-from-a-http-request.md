---
layout: post
title: How to determine SSL/TLS version from a HTTP request
categories: [tech]
---
Let's say you want to know the version of SSL/TLS in use for the request: https://my-host.com/test

In a command prompt, just run the following command. The SSL/TLS version will be displayed alongside with some information about certificates.

{% highlight shell %}openssl s_client -connect my-host.com:443{% endhighlight %}
