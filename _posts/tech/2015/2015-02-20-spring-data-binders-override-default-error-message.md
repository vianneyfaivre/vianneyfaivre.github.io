---
layout: post
title: "Spring web data binders : override default error message"
categories: [tech]
---
When binding a HTML form to a Java bean using Spring technology, you may have type conversions issues that will display an ugly error message.

For instance, you have an input that binds to a BigDecimal attribute in a Java bean.

{% highlight xml %}
<form:form modelAttribute="myBean" action="${submitURL}" method="post">
  <form:input path="myBigDecimalProperty" value="${myBean.myBigDecimalProperty}" />
  <button type="submit">Submit</button>
</form>
{% endhighlight %}

If you type in letters in your input and you submit the form, the following error will be displayed :

<span style="color:#ff0000;">Failed to convert property value of type java.lang.String to required type java.math.BigDecimal for property myBigDecimalProperty; nested exception is java.lang.IllegalArgumentException: Could not parse number: Unparseable number: "thisisnotabigdecimalvalue"</span>

<!--more-->

If a user see that kind of error, he will throw his computer through the window and claim he has been attacked by north korean hackers.

You should solve that issue by adding new messages in a resource bundle file :

For a specific type :

{% highlight properties %}
typeMismatch.java.math.BigDecimal=Only numbers are allowed!
{% endhighlight %}

For a specific Java property :

{% highlight properties %}
typeMismatch.myBigDecimalProperty=The field ‘myBigDecimalProperty’ should be a number.
{% endhighlight %}

Have a look to [this piece of documentation](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/validation/DefaultMessageCodesResolver.html
) to understand how error messages are built.