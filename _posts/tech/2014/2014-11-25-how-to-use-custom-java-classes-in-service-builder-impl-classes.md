---
layout: post
title: "How to use custom Java classes in service builder *impl classes"
categories: [tech]
---
Liferay Service-Builder mechanism generates a lot of code, it’s very easy to use and it lets you use the Liferay Service API.

If you want to use external classes in your service impl classes you must use a special annotation : <strong>@BeanReference </strong>(from the package com.liferay.portal.kernel.bean)

Using this annotation you can inject your classes into your service and then use it without having any exceptions on class loading context.
<!--more-->

<h3>Steps</h3>

<ol>
<li>Declare the bean you want to inject in the spring configuration file of your portlet</li>

{% highlight xml %}
<bean id="com.test.service.MyService" class="com.test.service.impl.MyServiceImpl" />
{% endhighlight %}

<li>Make a reference to this bean in your service impl class</li>

{% highlight java %}
@BeanReference(type = MyService.class)
private MyService myService;
{% endhighlight %}

</ol>

Et voila! Now you can use the service "myService" in your service impl methods :)

NB : if you want to understand how the injection is done, have a look at this class : BeanReferenceAnnotationBeanPostProcessor
