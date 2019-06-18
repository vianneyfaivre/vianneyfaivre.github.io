---
layout: post
title: How to pass variables from scriptlet to EL context
categories: [tech]
---
Sometimes you may need to pass a variable from scriptlet context to EL context in your JSPs, and vice versa. The following snippets could help you.
<!--more-->
From scriptlet to EL :

{% highlight xml %}
<c:set var="myELVar"><%=myScriptletVar%></c:set>
{% endhighlight %}

From EL to scriptlet :

{% highlight xml %}
<% String myScriptletVar = String.valueOf(pageContext.getAttribute("myELVar")); %>
{% endhighlight %}

In general, try to avoid using scriptlets ! :)
