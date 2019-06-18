---
layout: post
title: "Liferay 6: SQL query to get non-instantiated portlets"
categories: [tech]
---
This SQL query lets you know the list of custom portlets that are not-instantiated (that has no entry in portlet preferences table).

(I wrote this query for a MS SQL DB, if you want to use it for another DB there are a few changes to make)

<!--more-->

It only checks for portlet ids that are not numbers (to exclude Liferay portlets).

This query is based on the fact that if a portlet is used, it has an entry in table `PortletPreferences`.

{% highlight sql %}
select distinct all_portlets.portletId 
from
    (select portletId from Portlet where IsNumeric(portletId)<>1) all_portlets
left join 
    (
        select distinct p.portletId
        from
            (select portletId, len(portletId) as len from Portlet where IsNumeric(portletId)<>1) p,
            PortletPreferences pp
        where left(pp.portletId, p.len) = p.portletId
    ) used_portlets
on all_portlets.portletId = used_portlets.portletId
where used_portlets.portletId is null;
{% endhighlight %}

You can have the list of portlets that are instantiated by changing the last line of the query from {% highlight java %}where used_portlets.portletId is null{% endhighlight %} to {% highlight java %}where used_portlets.portletId is not null{% endhighlight %}
