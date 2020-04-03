---
layout: post
title: "Oracle Database - Get unique indexes of a table"
categories: [tech]
---

Here is a snippet to get the list of unique indexes of a particular table.

{% highlight sql %}
select c.*
from ALL_INDEXES i, ALL_IND_COLUMNS c
where
    i.table_name = c.table_name
    and i.table_owner = c.table_owner
    and i.table_owner = 'THE_TABLE_OWNER'
    and i.table_name = 'YOUR_TABLE'
    and i.uniqueness = 'UNIQUE';
order by c.INDEX_NAME, c.TABLE_NAME, c.COLUMN_NAME;
{% endhighlight %}

Tested with Oracle Database 12.1