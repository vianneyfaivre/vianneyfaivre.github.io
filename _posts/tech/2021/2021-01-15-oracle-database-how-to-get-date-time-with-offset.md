---
layout: post
title: "Oracle Database - How to get date and time with offset"
categories: [tech]
---

Oracle syntax for date and time can be quite tricky and slightly different compared to Java.

Here is a SQL Query to get the date and time with & without offset:

{% highlight sql %}
select
    TO_CHAR(systimestamp, 'yyyy-MM-dd"T"HH24:MI:SS.ff3TZH:TZM') as "NOW_WITH_OFFSET",
    TO_CHAR(sysdate, 'yyyy-MM-dd"T"hh:MI:ss') as "NOW_WITHOUT_OFFSET"
from 
    dual;
{% endhighlight %}

More details about the format: [Oracle Documentation](https://docs.oracle.com/cd/B19306_01/server.102/b14200/sql_elements004.htm#i34924)

Tested with Oracle 12.