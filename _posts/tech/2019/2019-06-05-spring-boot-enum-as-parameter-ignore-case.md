---
layout: post
title: "Spring Boot: How to ignore case when using an Enum as a Request parameter"
categories: [tech]
---

Here is a way to enable the use of case-insensitive enumerations request parameters. You won't need to do any code modification in your enum.

Let's say you have a controller class like this:

{% highlight java %}
@RestController
public class MyController {
    
    @GetMapping("/test/{myEnum}")
    public String getMyEnum(@PathVariable MyEnum myEnum) {
        return "Hey " + myEnum;
    }
}
{% endhighlight %}

And an Enum like this:

{% highlight java %}
public enum MyEnum {
    HEY,
    HELLO
}
{% endhighlight %}

You have to add the following Spring Boot configuration:

{% highlight java %}
@Configuration
public class WebMvcConfig implements WebMvcConfigurer {
    
    @Override
    public void addFormatters(FormatterRegistry registry) {
        ApplicationConversionService.configure(registry);
    }
}
{% endhighlight %}
 
Tests:
* `GET /test/hEy` will return `Hey HEY`
* `GET /test/HELLO` will return `Hey HELLO`
* `GET /test/hello` will return `Hey HELLO`

Tested with Spring Boot 2.1.4