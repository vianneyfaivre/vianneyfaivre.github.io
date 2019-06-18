---
layout: post
title: "Spring WS: How to configure HTTP Basic auth for a SOAP client"
categories: [tech]
---
Here is a way to enable HTTP Basic auth for a SOAP client developed using Spring-WS.

In every request sent by our SOAP client, the HTTP header `Authorization` has to be set.

<!--more-->

<h3>Dependencies</h3>

POM Parent : `org.springframework.boot:spring-boot-starter-parent:1.3.8.RELEASE`
`org.springframework.boot:spring-boot-starter-ws` (implied version 2.2.3.RELEASE)
`org.apache.httpcomponents:httpcore` (implied version 4.4.5)
`org.apache.httpcomponents:httpclient` (implied version 4.5.2)

<h3>Java client</h3>

Spring WS uses Apache HttpComponents, you just have to configure it in the right way when creating the WebServiceTemplate instance.

You have to create a custom WebServiceMessageSender instance:

{% highlight java %}
@Bean
public WebServiceMessageSender myMsgSender() {
  HttpComponentsMessageSender msgSender = new HttpComponentsMessageSender() {
    @Override
    protected HttpContext createContext(URI uri) {
      HttpHost target = new HttpHost(uri.getHost(), uri.getPort(), uri.getScheme());
      
      // Create AuthCache instance
      AuthCache authCache = new BasicAuthCache();
      // Generate BASIC scheme object and add it to the local
      // auth cache
      BasicScheme basicAuth = new BasicScheme();
      authCache.put(target, basicAuth);

      // Add AuthCache to the execution context
      HttpClientContext localContext = HttpClientContext.create();
      localContext.setAuthCache(authCache);
      
      return localContext;
    }
  };
  
  return msgSender;
}
{% endhighlight %}

(<a href="https://hc.apache.org/httpcomponents-client-4.5.x/httpclient/examples/org/apache/http/examples/client/ClientPreemptiveBasicAuthentication.java" target="_blank">the code in the method createContext comes from Apache HttpComponents samples</a>)

Then you have to set this factory to your webservice template configuration:

{% highlight java %}
WebServiceTemplate wsTemplate = new WebServiceTemplate();

// WebServiceTemplate init: URI, msg factory, etc.

wsTemplate.setMessageSender(myMsgSender());
{% endhighlight %}

Let me know if it does not work for you.
