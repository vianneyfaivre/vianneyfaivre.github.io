---
layout: post
title: "Java - How to parse milliseconds"
categories: [tech]
---

Here is how you can parse milliseconds of a date-time with java.

{% highlight java %}
public static void main(String[] args) {

    var pattern = "yyyy-MM-dd'T'HH:mm:ss[.SSS][.SS][.S]";
    var formatter = DateTimeFormatter.ofPattern(pattern);

    var dateWith0S = formatter.parse("2024-01-21T16:42:33");
    var dateWith1S = formatter.parse("2024-01-22T16:42:33.1");
    var dateWith2S = formatter.parse("2024-01-23T16:42:33.12");
    var dateWith3S = formatter.parse("2024-01-24T16:42:33.123");

    System.out.println(dateWith0S);
    System.out.println(dateWith1S);
    System.out.println(dateWith2S);
    System.out.println(dateWith3S);
}
{% endhighlight %}