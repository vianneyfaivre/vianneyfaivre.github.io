---
layout: post
title: "Spring MVC: Get request body as String"
categories: [tech]
---

The following code will print the request headers and the request body as a plain String.

{% highlight java %}
@PostMapping("/process")
public void process(HttpEntity<String> request) {

    System.out.println("headers: "+request.getHeaders());
    System.out.println("body: "+request.getBody());
}
{% endhighlight %}