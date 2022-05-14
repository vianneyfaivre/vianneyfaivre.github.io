---
layout: post
title: "Spring Boot x Spring Cloud - Compatibility Grid"
categories: [tech]
---

To know which version of Spring Cloud you should use with your version of Spring Boot, you can check this compatibility grid: 
{% highlight json %}

"spring-cloud": {
      "Hoxton.SR12": "Spring Boot >=2.2.0.RELEASE and <2.4.0.M1",
      "2020.0.5": "Spring Boot >=2.4.0.M1 and <2.6.0-M1",
      "2021.0.0-M1": "Spring Boot >=2.6.0-M1 and <2.6.0-M3",
      "2021.0.0-M3": "Spring Boot >=2.6.0-M3 and <2.6.0-RC1",
      "2021.0.0-RC1": "Spring Boot >=2.6.0-RC1 and <2.6.1",
      "2021.0.2": "Spring Boot >=2.6.1 and <2.6.8-SNAPSHOT",
      "2021.0.3-SNAPSHOT": "Spring Boot >=2.6.8-SNAPSHOT and <3.0.0-M1",
      "2022.0.0-M1": "Spring Boot >=3.0.0-M1 and <3.0.0-M2",
      "2022.0.0-M2": "Spring Boot >=3.0.0-M2 and <3.1.0-M1"
}
{% endhighlight %}

Extracted from [here](https://start.spring.io/actuator/info) in May 2022.