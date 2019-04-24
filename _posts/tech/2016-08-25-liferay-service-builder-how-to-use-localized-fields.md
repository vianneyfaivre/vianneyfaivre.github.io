---
layout: post
title: "Liferay Service Builder: How to use localized fields"
categories: [tech]
---
Liferay has a built-in mechanism for handling localization of some DB fields. It uses a particular XML format and some APIs to get a value based on a `java.util.Locale`.

<!--more-->

You have to use the Service Builder to leverage this capability. Below are the different steps to follow.

<h3>Definition of your entity in service.xml</h3>

You have to add the attribute `localized=true` on the field you want to be localized.

{% highlight xml %}
<entity name="MyEntity">
…
  <column name="title" type="String" localized="true" />
…
</entity>
{% endhighlight %}

<h3>What’s generated at model layer</h3>

Couple of new methods are generated for the entity `MyEntity`, here are the important ones:

<ul>
<li><strong>getTitle()</strong> : returns the plain XML value stored in database</li>
<li><strong>getTitle(locale)</strong> : returns the localized value of the field given the locale. If the translation is not available, the default translation will be retrieved</li>
<li><strong>getTitleMap()</strong> : returns the XML parsed as a Map, containing all translations of the field</li>
</ul>

<h3>View layer</h3>

In the view part you have to use a specific tag from taglib `liferay-ui`. It will generate an input text and a piece of UI to add more translations (same as you have when creating a Layout).

You have to pass the plain XML value of the field `title` using method `myEntity#getTitle()`

{% highlight xml %}
<c:set var="titleAsXML">
 <c:out value="${myEntity.title}" escapeXml="false"  />
</c:set>
                    
<liferay-ui:input-localized
  formName="myForm"  
  name="titleLocalization"
  xml="${titleAsXML}" 
/>
{% endhighlight %}

Be careful on the attribute `formName`, it has to be the name of your form without the portlet namespace (it will be added when generating HTML)

<h3>Controller layer</h3>

In your controller layer, you just have to use a custom method to retrieve all the translations of the field from the request (the tag generates inputs text with a special name : field name + locale)

Here is the method to use:

{% highlight java %}
Map<Locale, String> titleAsMap = LocalizationUtil.getLocalizationMap(portletRequest, "titleLocalization");
{% endhighlight %}

<h3>Service layer -- Creation / Update of a MyEntity record</h3>

When creating / updating a MyEntity record you have to use the method `MyEntity#setTitleMap`.

It takes a `Map` as input, the one you just retrieved in the controller layer.
