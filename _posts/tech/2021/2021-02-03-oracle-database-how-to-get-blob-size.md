---
layout: post
title: "Oracle Database - How to get the length of a blob"
categories: [tech]
---

If your blob is a long string, the easiest way to get its length is to use one of Oracle stored procedures `dbms_lob.getlength`:

{% highlight sql %}
select 
    dbms_lob.getlength(YOUR_BLOB_COLUMN)
from 
    YOUR_TABLE;
{% endhighlight %}

Tested with Oracle 12.