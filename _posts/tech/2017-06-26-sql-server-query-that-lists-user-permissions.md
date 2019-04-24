---
layout: post
title: "SQL Server: Query that lists user permissions"
categories: [tech]
---
This query lists the permissions of the connected user has on the database.

{% highlight sql %}SELECT * FROM fn_my_permissions (NULL, 'DATABASE');{% endhighlight %}

This function is available since SQL Server 2008. It can retrieve a lot of interesting information, <a href="https://docs.microsoft.com/en-us/sql/relational-databases/system-functions/sys-fn-my-permissions-transact-sql" target="_blank">see the Microsoft documentation page about it</a>
