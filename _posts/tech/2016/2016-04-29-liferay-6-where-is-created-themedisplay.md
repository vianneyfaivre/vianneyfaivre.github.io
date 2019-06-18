---
layout: post
title: "Liferay 6: Where is created ThemeDisplay?"
categories: [tech]
---
In Liferay the object "ThemeDisplay" is kind of a god-object, it contains a lot of fields/methods that might be useful all around the portal.

<!--more-->

All the data provided by this object is not especially related to Liferay themes, so if you are looking for a specific piece of data you should at least give a look to that object. You might find what you want in it.

<h3>Init of the ThemeDisplay instance</h3>

It could be useful to know how this god-object is generated, all the source code is available in the class <em>com.liferay.portal.events.ServicePreAction</em>, method <em>initThemeDisplay</em>.

<h3>ThemeDisplay in JSP</h3>

{% highlight java %}
<liferay-theme:defineObjects />
<% 
themeDisplay.getUserId();
%>
{% endhighlight %}
(source of the tag: <em>com.liferay.taglib.theme.DefineObjectsTag</em>)

<h3>ThemeDisplay in Java controller</h3>

{% highlight java %}
ThemeDisplay themeDisplay = (ThemeDisplay)request.getAttribute(
            WebKeys.THEME_DISPLAY);
{% endhighlight %}

<h3>ThemeDisplay in Velocity (VM)</h3>

{% highlight java %}
$themeDisplay.getUserId()
{% endhighlight %}

(added in Velocity context from this class: <em>com.liferay.portal.velocity.VelocityVariablesImpl</em>)

<h3>ThemeDisplay in Freemarker (FTL)</h3>

{% highlight java %}
themeDisplay.getUserId()
{% endhighlight %}

(added in Freemarker context from this class: <em>com.liferay.portal.freemarker.FreeMarkerVariablesImpl</em>)
