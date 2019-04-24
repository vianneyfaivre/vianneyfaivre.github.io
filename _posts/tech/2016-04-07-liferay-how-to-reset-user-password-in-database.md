---
layout: post
title: "Liferay: how to reset user password in database (use in dev dev only!)"
categories: [tech]
---
<h2>Warnings</h2>

Don’t do this in production environments! Following this procedure will store passwords in clear text in your database!

It can be useful if you want to reset default admin user password, or somebody’s password in a <strong>test</strong> environment.

<!--more-->

<h2>Procedure</h2>

Find the user id of the user you want to reset his password. Pretty easy to find in database (hint: table <em>User_</em> ;) )

<ul>
<li>Stop Liferay</li>
<li>Execute this query</li>
</ul>

{% highlight sql %}
UPDATE 
	User_
SET 
	password_ = '<PASSWORD_IN_CLEAR_TEXT>',
    passwordEncrypted = 0
WHERE 
	userId = <USER_ID>
;
{% endhighlight %}

<ul>
<li>Start Liferay</li>
<li>Login with new password! It’s working fine :)</li>
</ul>

Did I say that you should not do it in production environments? ;)
