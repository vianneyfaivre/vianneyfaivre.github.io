---
layout: post
title: "Spring Boot: How to set RestTemplate read timeout"
categories: [tech]
---

<p>Using the class RestTemplateBuilder it is very easy to configure the RestTemplate you need.</p>

<p>Here is a snippet that shows you how to configure the read timeout on a RestTemplate instance.</p>

<p>NB: you can set timeouts in java.time.Duration (instead of int) since Spring Boot 2.1</p>

{% highlight java %}
@Component
public class MyRestClient {

  @Value("${service.client.timeout.read}")
  private Duration readTimeout;

  private RestTemplate restTemplate;

  public MyRestClient(RestTemplateBuilder restTemplateBuilder) {
     this.restTemplate = restTemplateBuilder
               .setReadTimeout(readTimeout)
               .build();
  }
  
  // Code that actually uses RestTemplate...
}
{% endhighlight %}

<p>Then you just have to set the value of the property "service.client.timeout.read" (instead of hardcoding it)</p>

<pre class="wp-block-syntaxhighlighter-code brush: plain; notranslate">service.client.timeout.read=5s</pre>
