---
layout: post
title: "Liferay: How portal Javascript files are imported"
categories: [tech]
---
In this post I’m going to describe how Liferay loads JS files for the whole portal and how we can add new JS imports.

A lot of JS files are loaded by Liferay portal. In the <strong>portal.properties</strong> file you can see the list of files imported when a user is not connected ("barebone") and when a user is connected ("everything").

<!--more-->

The two properties are located in portal.properties file:

<ul>
    <li>javascript.barebone.files : the minimum list of JS files required</li>
    <li>javascript.everything.files : barebone JS files + others</li>
</ul>

Then, either barebone or everything JS files are loaded using HTML "script" tag in the file "<strong>top_js.jspf</strong>":

{% highlight java %}
<%
	String[] javaScriptFiles = null;

	if (themeDisplay.isThemeJsBarebone()) {
		javaScriptFiles = JavaScriptBundleUtil.getFileNames(PropsKeys.JAVASCRIPT_BAREBONE_FILES);
	}
	else {
		javaScriptFiles = JavaScriptBundleUtil.getFileNames(PropsKeys.JAVASCRIPT_EVERYTHING_FILES);
	}

	for (StringjavaScriptFile :javaScriptFiles) {
%>
		<script src="<%= themeDisplay.getCDNHost() + themeDisplay.getPathJavaScript() %>/<%= javaScriptFile %>?t=<%= javaScriptLastModified %>" type="text/javascript"></script>
<%  } %> 
{% endhighlight %}

Side note: if the property "javascript.fast.load" is set to true, all JS files are packaged in one single JS file and imported in this JSP.

The JS files that can be added to these two lists must be located in the folder "/html/js" of a webapp.

Try to always import JS files that are in a project that is always deployed in your application server to ensure the JS file imported will always exist, for example in a hook or a theme (I always liked the word 'always').

New JS files added must be appended to the existing list, so you have to override the property "javascript.barebone.files" or "javascript.everything.files" in your portal-ext.properties file.

This pretty simple mechanism lets you add JS files at portal level in a proper way.
