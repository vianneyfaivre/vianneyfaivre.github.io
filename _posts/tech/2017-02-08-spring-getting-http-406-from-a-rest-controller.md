---
layout: post
title: "Spring: Getting HTTP 406 from a REST controller"
categories: [tech]
---
You may get a `HTTP 406 Not Acceptable` error while trying to return Java objects from a REST controller.

The server is not able to handle your request because the HTTP header "Accept" does not match with any of the content types it can handle.

In fact, the server might be unable to deliver the response in whatever content-type, some piece of configuration is missing in your project.

<!--more-->

<h2>Example</h2>

Let's declare a "GET /dogs" method in your Spring @Controller:

{% highlight java %}
@RequestMapping(value = "/dogs", method = RequestMethod.GET)
@ResponseBody
public List getDogs() {
  return this.dogRepository.getAllDogs();
}
{% endhighlight %}

Using Spring you have to declare a mapper in order to tell Spring how to convert Java POJO to whatever content type.
Let's say you want to convert your POJOs to JSON, so you have to use a <strong>JSON Mapper</strong>.

<h2>Maven dependencies to add</h2>

<h5>Spring version = 3.1.2.RELEASE</h5>

{% highlight xml %}

<dependency>
    <groupId>org.codehaus.jackson</groupId>
    <artifactId>jackson-core-asl</artifactId>
    <version>1.9.13</version>
</dependency>

<dependency>
    <groupId>org.codehaus.jackson</groupId>
    <artifactId>jackson-mapper-asl</artifactId>
    <version>1.9.13</version>
</dependency>	

{% endhighlight %}

<h5>Spring version >= 3.1.2 RELEASE</h5>

{% highlight xml %}

<dependency>
    <groupId>com.fasterxml.jackson.core</groupId>
    <artifactId>jackson-core</artifactId>
    <version>2.8.6</version>
</dependency>

<dependency>
    <groupId>com.fasterxml.jackson.core</groupId>
    <artifactId>jackson-databind</artifactId>
    <version>2.8.6</version>
</dependency>	

{% endhighlight %}

Just redeploy your webapp and you'll be able to get your Java POJO as a JSON object.

<h5>Side notes:</h5>

<ul>
    <li>You can use the class annotation @RestController to avoid adding method annotation @ResponseBody</li>
    <li><a href="https://tools.ietf.org/html/rfc7231#section-6.5.6" target="_blank" rel="noopener">HTTP 406 RFC</a></li>
</ul>
