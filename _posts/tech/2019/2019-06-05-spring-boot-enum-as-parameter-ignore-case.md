---
layout: post
title: "Spring Boot: How to ignore case when using an Enum as a Request parameter"
categories: [tech]
---

Here is a way to enable the use of case-insensitive enumerations request parameters. You won't need to do any code modification in your enum.

Let's say you have a controller class:

{% highlight java %}
@RestController
public class MyController {
    
    @GetMapping("/test/{myEnum}")
    public String getMyEnum(@PathVariable MyEnum myEnum) {
        return "Hey " + myEnum;
    }
}
{% endhighlight %}

And an Enumeration:

{% highlight java %}
public enum MyEnum {
    HEY,
    HELLO
}
{% endhighlight %}

You have to create a custom Spring converter that converts String into MyEnum:

{% highlight java %}

import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

@Component
public class MyEnumConverter implements Converter<String, MyEnum> {

    @Override
    public MyEnum convert(String value) {
        return MyEnum.valueOf(value.toUpperCase());
    }
}
{% endhighlight %}
 
Tests:
* `GET /test/hEy` will return `Hey HEY`
* `GET /test/HELLO` will return `Hey HELLO`
* `GET /test/hello` will return `Hey HELLO`

Tested with Spring Boot 2.2.6