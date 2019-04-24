---
layout: post
title: "Java 8: how to filter out Optional.absent() items from a stream"
categories: [tech]
---
I use java.util.Optional a lot.

Explicitly telling that a method might not return a result == no more null check == no more NullPointerException.

<!--more-->

I also use streams a lot, here is a snippet that demonstrate how to filter out Optional.absent() values from a stream.

{% highlight java %}
Arrays.asList(1, 2, 3, 4, 5)
  .stream()
  // Remove odd values
  .map(i -> i % 2 == 1 ? Optional.empty() : Optional.of("s"+i))
  // Remove empty items from the stream
  .flatMap(o -> o.isPresent() ? Stream.of(o.get()) : Stream.empty())
  // Print to stdout
  .forEach(System.out::println);
{% endhighlight %}
