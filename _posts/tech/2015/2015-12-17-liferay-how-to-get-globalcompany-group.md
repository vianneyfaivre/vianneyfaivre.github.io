---
layout: post
title: "Liferay: how to get global/company group"
categories: [tech]
---
Below a simple snippet that let you find a special group of your company: the global group (also called company group). 
<!--more-->
This system group may hold all a lot of company common data (structures, templates, categories, etc.). Data declared in this group will be available for all other sites of this company.

Here are two ways for getting it:
{% highlight java %}
Group globalGroup = GroupLocalServiceUtil.getCompanyGroup(companyId); 
{% endhighlight %}

{% highlight java %}
company.getGroup(); // Implementation available in companyImpl#getGroup
{% endhighlight %}
