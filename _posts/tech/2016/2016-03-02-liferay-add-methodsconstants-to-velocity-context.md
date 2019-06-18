---
layout: post
title: "Liferay: Add methods/constants to Velocity context"
categories: [tech]
---
In your Velocity templates you may need to access some parts of your API / constants. Here is one simple way to do this (there are other ways).

Here are the steps:

<ol>
<li>Create a class that extends com.liferay.portal.kernel.events.Action</li>
<li>Register this action in portal-hook.properties</li>
<li>Enjoy!</li>
</ol>

<!--more-->

<h3>1. Create a class that extends com.liferay.portal.kernel.events.Action</h3>

This class should be put in a Liferay hook. This Action class will be executed by Liferay once your server has started.

In the below code snippet we add to velocity context:
- one Java object (use a singleton if it’s a util class) : instance of MyUtilClass
- one Java const called "MY_CONST" with the value "WORLD"

{% highlight java %}
@Override
public void run(final HttpServletRequest request, final HttpServletResponse response) throws ActionException {

  Map <String, Object> vmVariables = (Map <String, Object> ) request.getAttribute(WebKeys.VM_VARIABLES);

  if (vmVariables == null) {
    vmVariables = new HashMap <String, Object> ();
    vmVariables.put("myUtilClass", getMyUtilClassWrapper());
    vmVariables.put("MY_CONST", "WORLD");
  }
  
  request.setAttribute(WebKeys.VM_VARIABLES, vmVariables);
}

private static final MyUtilClass MY_UTIL_CLASS;

private static MyUtilClassWrapper getMyUtilClassWrapper() {
  if (MY_UTIL_CLASS == null) {
    MY_UTIL_CLASS = new MyUtilClass();
  }
  return MY_UTIL_CLASS;
}
{% endhighlight %}

<h3>2. Register this action in portal-hook.properties</h3>

{% highlight properties %}servlet.service.events.pre=com.test.MyUtilClassWrapper{% endhighlight %}

Then build &amp; deploy your hook.

Liferay will execute this action in the class MainServlet, check Liferay source code if you want to have a better understanding of the logic.

<h3>3. Enjoy!</h3>

Now in your velocity templates you can use your Java object and your Java constant:
{% highlight properties %}
$myUtilClass.sayHello()
$MY_CONST{% endhighlight %}

There are other ways to do it, I think that this one is the most simple one.
