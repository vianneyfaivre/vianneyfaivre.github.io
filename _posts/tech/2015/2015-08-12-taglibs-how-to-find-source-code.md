---
layout: post
title: "How to find taglibs source code"
categories: [tech]
---
You were reading some code in a JSP when you found a tag that you have never seen before.

Let’s take a basic example, imagine I just found this piece of code:

{% highlight xml %}
<aui:script>
alert("hey");
</aui:script>
{% endhighlight %}

The value of this tag seems to be Javascript but I can’t be sure because I don’t know what does the tag "aui:script".
<!--more-->

<h3>How to find the definition of the tag</h3>

First we can see that this tag is prefixed by "aui", it’s the short name of the tag library that is used.
It is defined somewhere in the JSP, you have to look out at the beginning of the file or in another JSP included.

In my example, here is the declaration of the taglib:

{% highlight xml %}<%@ taglib uri="http://alloy.liferay.com/tld/aui" prefix="aui" %>{% endhighlight %}

The taglib declaration is associated to a "Tag Library Description" file ("tld" extension), based on the URI, the one we are looking for is called "aui.tld".

This file contains the description of the tags of the tag library "aui". It’s a XML file, the syntax is validated by a XML Schema definition (XSD).

We are looking for the tag called "script", here is its description:

{% highlight xml %}
<tag>
        <name>script</name>
        <tag-class>com.liferay.taglib.aui.ScriptTag</tag-class>
        <body-content>JSP</body-content>
        <attribute>
            <name>position</name>
            <required>false</required>
            <rtexprvalue>true</rtexprvalue>
            <type>java.lang.String</type>
        </attribute>
        <attribute>
            <name>use</name>
            <required>false</required>
            <rtexprvalue>true</rtexprvalue>
            <type>java.lang.String</type>
        </attribute>
</tag>
{% endhighlight %}

This little piece of XML tells us:

<ul>
<li>this tag may have two attributes "position" and "use"</li>
<li>there is a java class associated called "ScriptTag"</li>
<li>JSP files will be called in order to generate the final HTML</li>
</ul>

This description does not give us more details on the possible values of attributes and their effect on the generation of the final HTML. So we have to dive into the code!

<h3>What does my taglib ?</h3>

In the TLD we can see the Java class associated to the tag we are looking for. So the next step is to read the source, most of the time taglibs are not so big.

In the "aui:script" example, the associated Java class is <a href="https://github.com/liferay/liferay-portal/blob/master/util-taglib/src/com/liferay/taglib/aui/ScriptTag.java" target="_blank">"com.liferay.taglib.aui.ScriptTag"</a>.
By reading the Java and JSP source code we can easily see what are the values for the attributes "position" and "use".

My last piece of advice is that you should have at least two best friends:

<ul>
    <li>source code: always read it and try to understand it</li>
    <li>debugger: helps you to understand code logic</li>
</ul>
