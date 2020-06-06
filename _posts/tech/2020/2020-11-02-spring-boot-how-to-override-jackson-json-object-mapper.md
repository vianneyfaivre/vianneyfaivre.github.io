---
layout: post
title: "Spring Boot - How to override Jackson JSON ObjectMapper object"
categories: [tech]
---

Here is a way to override the configuration of the auto-configured `ObjectMapper` object.

{% highlight java %}
package com.vianneyfaivre.config;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;

import java.util.TimeZone;

/**
* Overrides the default Spring Boot configuration of Jackson JSON {@link ObjectMapper}
*/
@Configuration
public class JsonConfig extends MappingJackson2HttpMessageConverter {

    public JsonConfig(ObjectMapper objectMapper) {
        super(objectMapper);

        // TODO: here you can do whatever you want with the objectMapper object 

        // Example of configuration: Set default timezone when serializing/deserializing dates
        objectMapper.setTimeZone(TimeZone.getTimeZone("GMT+12:00"));
    }
}
{% endhighlight %}

Tested with Spring Boot 2.3.