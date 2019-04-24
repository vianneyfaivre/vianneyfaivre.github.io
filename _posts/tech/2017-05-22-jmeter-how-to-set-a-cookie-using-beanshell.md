---
layout: post
title: "JMeter : How to set a Cookie using Beanshell"
categories: [tech]
---
Here is a Beanshell script that will add a cookie to the cookies sent in every HTTP request.

{% highlight java %}
import org.apache.jmeter.protocol.http.control.Cookie;

// Retrieve the cookie value from a JMeter variable called "myCookieValue"
String cookieValue = vars.get("myCookieValue");

// Create a new Cookie and add it to the cookie manager
Cookie cookie = new Cookie("cookieName", cookieValue , "localhost", "/", false, -1);
ctx.getCurrentSampler().getCookieManager().add(cookie); 

log.info("Cookie added: "+cookie);
{% endhighlight %}

<strong>NB: Please remind to add a ´HTTP Cookie Manager´ to your thread group.</strong>
