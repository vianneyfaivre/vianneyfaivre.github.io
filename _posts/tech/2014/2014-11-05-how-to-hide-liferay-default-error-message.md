---
layout: post
title: How to hide Liferay default error message
categories: [tech]
---
When a server-side error occur in Liferay, a default message could be shown to the user: "Your request failed to complete."

This message is displayed when an exception is not planned to be thrown in the current JSP.
<!--more-->
If you want to understand how and when this default message is displayed, have a look at the file "/html/taglib/ui/error/end.jsp".

<h2><b>Hide the default error message in a specific page</b></h2>

Use this snippet in the controller of your portlet when you want to hide the default error message in a specific case :

{% highlight java %}
SessionMessages.add(portletRequest, PortalUtil.getPortletId(portletRequest) + SessionMessages.KEY_SUFFIX_HIDE_DEFAULT_ERROR_MESSAGE);
{% endhighlight %}

(If you want to understand how it works, check the code of "/html/common/themes/portlet_messages.jspf" and search "KEY_SUFFIX_HIDE_DEFAULT_ERROR_MESSAGE")

<h2><b>Hide the default error message in every page</b></h2>

If you want to hide this error message everywhere in the portal you just have to edit the file "taglib/ui/error/end.jsp" via a hook.

The default error message is generated in this file (this JSP is a part of the taglib "liferay-ui:error")

Replace

{% highlight xml %}
<c:when test="<%= key == null %>">
  <c:if test="<%= !SessionErrors.isEmpty(portletRequest) %>">
    <div class="alert alert-error">
      <liferay-ui:message key="your-request-failed-to-complete" />
    </div>
    <%= rowBreak %>
  </c:if>
</c:when>
{% endhighlight %}

by

{% highlight xml %}
<c:when test="<%= key == null %>">
  <c:if test="<%= !SessionErrors.isEmpty(portletRequest) %>">
    <%= rowBreak %>
  </c:if>
</c:when>
{% endhighlight %}
