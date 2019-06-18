---
layout: post
title: "JMeter: Get HTTP response from Beanshell Post-Processor"
categories: [tech]
---
Here is a way to get the HTTP response as a String in a Beanshell Post-Processor:

{% highlight java %}
String httpResponseBody = new String(ctx.getPreviousResult().getResponseData());
log.info("HTTP Response Body: "+httpResponseBody);
{% endhighlight %}
