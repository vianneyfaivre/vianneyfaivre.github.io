---
layout: post
title: "Liferay 6: SQL Query to know where a portlet is deployed"
categories: [tech]
---
This SQL query lets you know where (site name + layout friendly URL) are deployed the instantiated portlets.

<!--more-->

{% highlight sql %}
select pp.portletId, group_.name, layout.friendlyURL
from 
	PortletPreferences pp,
	Layout layout,
	Group_ group_
where
	pp.plid = layout.plid
	and group_.groupId = layout.groupId
	and portletId like '%<YOUR_PORTLET_ID>%'
;
{% endhighlight %}

Replace `<YOUR_PORTLET_ID>` by the portletId.
