---
layout: post
title: "Java 8: how to filter out non Optional#isPresent() items from a stream"
categories: [tech]
---

Explicitly telling that a method might not return a result ==> no more `NullPointerException`

Here is how to filter out non Optional.isPresent() values from a stream.

{% highlight java %}
Arrays.asList(1, 2, 3, 4, 5).stream()
  
  // Remove odd values
  .map(i -> i % 2 == 1 ? Optional.empty() : Optional.of("s"+i))
  
  // Remove empty items from the stream
  .flatMap(o -> o.map(Stream::of).orElseGet(Stream::empty))
  
  // Print to stdout
  .forEach(System.out::println);
{% endhighlight %}
