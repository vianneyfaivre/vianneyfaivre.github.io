---
layout: post
title: "Spring WS: How to configure WS-Security auth for a SOAP 1.1 client"
categories: [tech]
---
I had to create a Java client that calls a "secured" (WS-Security standards) SOAP 1.1 webservice. I chose to use the latest version of Spring-WS to do so.

<!--more-->

<h3>Dependencies</h3>

POM Parent: `org.springframework.boot:spring-boot-starter-parent:1.3.8.RELEASE`

Important dependencies:

* `org.springframework.boot:spring-boot-starter-ws` (implied version 2.2.3.RELEASE)
* `org.springframework.ws:spring-ws-security` (implied version 2.2.3.RELEASE)
* `org.apache.ws.security:wss4j:1.6.19`

<h3>SOAP Request</h3>

The security part of the SOAP request I need to generate looks like this:

{% highlight xml %}
<soapenv:Header>
  <wsse:Security 
    xmlns:wsse="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd" 
    xmlns:wsu="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd"
    soapenv:mustUnderstand="1">
    
    <wsse:UsernameToken wsu:Id="UsernameToken-99B1FD1F061EA5C25314914201395332">
      <wsse:Username>WS-USERNAME</wsse:Username>
      <wsse:Password Type="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-username-token-profile-1.0#PasswordText">WS-PASSWORD-CLEARTEXT</wsse:Password>
    </wsse:UsernameToken>
    
    <wsu:Timestamp wsu:Id="TS-99B1FD1F061EA5C25314914201395241">
      <wsu:Created>2017-04-05T19:22:19.521Z</wsu:Created>
      <wsu:Expires>2017-04-05T19:27:19.521Z</wsu:Expires>
    </wsu:Timestamp>
    
  </wsse:Security>
</soapenv:Header>
{% endhighlight %}

<h3>Java client</h3>

Below is the way to generate a SOAP request like the one above. It uses `Wss4jSecurityInterceptor` Spring interceptor

{% highlight java %}
@Bean
public Wss4jSecurityInterceptor securityInterceptor() {
  Wss4jSecurityInterceptor security = new Wss4jSecurityInterceptor();
  
  // Adds "Timestamp" and "UsernameToken" sections in SOAP header
  security.setSecurementActions(WSHandlerConstants.TIMESTAMP + " " + WSHandlerConstants.USERNAME_TOKEN);
  
  // Set values for "UsernameToken" sections in SOAP header
  security.setSecurementPasswordType(WSConstants.PW_TEXT);
  security.setSecurementUsername(authUsername);
  security.setSecurementPassword(authPassword);
  return security;
}
{% endhighlight %}

Then you have to add this interceptor to your webservice template configuration:

{% highlight java %}
WebServiceTemplate wsTemplate = new WebServiceTemplate();

// WebServiceTemplate init: URI, msg factory, etc.

wsTemplate.setInterceptors(new ClientInterceptor[]{ securityInterceptor() });
{% endhighlight %}

If you have any issue, feel free to contact me.
