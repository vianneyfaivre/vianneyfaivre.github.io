---
layout: post
title: "How to solve issue SaajSoapMessageException: Could not write message to OutputStream"
categories: [tech]
---
<h3>SaajSoapMessageException error</h3>

While implementing a SOAP client using Spring WS I've got the following error when I tried to write the content of the SOAP message to my logger:

```
org.springframework.ws.soap.saaj.SaajSoapMessageException: Could not write message to OutputStream: Error during saving a multipart message; nested exception is com.sun.xml.internal.messaging.saaj.SOAPExceptionImpl: Error during saving a multipart message
at org.springframework.ws.soap.saaj.SaajSoapMessage.writeTo(SaajSoapMessage.java:280)
```
<!--more-->

<h3>Solution</h3>

After debugging pieces of code from package `com.sun.xml.internal.messaging.saaj.soap` I found out that <strong>the problem came from one of my SOAP Header that was empty</strong>: "action" (it's the SOAP action).

To solve it, be sure that when you create the WebserviceCallback instance you provide a non-empty soap action:

{% highlight java %}
String soapAction = getSoapAction();

if(StringUtils.isEmpty(soapAction)) {
   throw new ConfigurationRuntimeException("Soap action cannot be empty (ws uri "+getUri()+")");
}

WebServiceMessageCallback callback = new WebserviceCallBack(soapAction);
{% endhighlight %}

I prefer to throw a RuntimeException because it's kind of a fatal error.

<h3>Notes</h3>

Spring boot version : 1.3.3.RELEASE

Spring WS version : 2.2.3.RELEASE (defined by Spring boot)

The "ParseException" with an empty message is thrown by class `com.sun.xml.internal.messaging.saaj.packaging.mime.internet.ContentType` in constructor `ContentType(String s)`. Without debugging you can't guess that the issue comes from an empty soap header... They really should have put a meaningful message when throwing that exception