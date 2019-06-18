---
layout: post
title: "Liferay 6.1 : get authentified Liferay user in a standalone context"
categories: [tech]
---
Sometimes you need to develop outside the Liferay context, for example you have to create a custom servlet.

In some cases the authentified Liferay user &amp; ThemeDisplay objects are not available. Here is a way to get the user from the cookies set by Liferay after successful login.

<!--more-->

You should not use the below snippets as is to retrieve the authenticated user, this is not a safe way to be sure that the user that comes from the cookies is the one who is behind his screen. Someone might know how this cookie "ID" is generated and could easily generate a value that would impersonate another user. <strong>Be careful</strong>.

The cookie we are going to use is called "ID", it is set when user successfully logs in (see `LoginAction#login` and `LoginUtil#login`)

<h3>1 - Get the cookie "ID"</h3>

{% highlight java %}
Cookie[] cookies = request.getCookies();
String cookieIdValue = null;
if (cookies != null) {
   for (Cookie c : cookies) {
      if (CookieKeys.ID.equalsIgnoreCase(c.getName())) {
         cookieIdValue = c.getValue();
      }
   }
}
{% endhighlight %}

<h3>2 - Convert the hexadecimal cookie value to a String</h3>

{% highlight java %}
String cookieUserId = new String(Hex.decodeHex(cookieIdValue.toCharArray()));
{% endhighlight %}

<h3>3 - Decrypt the user ID and fetch the user from DB</h3>

{% highlight java %}
long companyId = PortalUtil.getCompanyId(request);
Company company = CompanyLocalServiceUtil.getCompanyById(companyId);
long userId = GetterUtil.getLong(Encryptor.decrypt(company.getKeyObj(), cookieUserId)     
return UserLocalServiceUtil.getUser(userId);
{% endhighlight %}
