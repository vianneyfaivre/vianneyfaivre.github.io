---
layout: post
title: "Spring WS: log HTTP Headers of SOAP request/response"
categories: [tech]
---
Here is another <strong>quick’n’dirty</strong> snippet for printing HTTP headers of SOAP requests/responses.

You can set the interceptor when creating the WebServiceTemplate object.

<!--more-->

Spring WS version : 2.2.3.RELEASE

{% highlight java %}
// import org.springframework.ws.*;
// import org.apache.http.Header;
// ArrayUtils (apache commons-lang)
// WebServiceTemplate wsTemplate

ClientInterceptor[] interceptors = wsTemplate.getInterceptors();
    
interceptors = (ClientInterceptor[]) ArrayUtils.add(interceptors, new ClientInterceptor() {
  @Override
  public boolean handleRequest(MessageContext messageContext) throws WebServiceClientException {
    return true;
  }

  @Override
  public boolean handleResponse(MessageContext messageContext) throws WebServiceClientException {
    return true;
  }

  @Override
  public boolean handleFault(MessageContext messageContext) throws WebServiceClientException {
    return true;
  }

  @Override
  public void afterCompletion(MessageContext messageContext, Exception ex) throws WebServiceClientException {
    HttpComponentsConnection connection = (HttpComponentsConnection) TransportContextHolder.getTransportContext().getConnection();

    String requestHeaders = "";
    for(Header header : connection.getHttpPost().getAllHeaders()) {
      requestHeaders += header.getName() + ": " + header.getValue() + "; ";
    }

    String responseHeaders = "";
    for(Header header : connection.getHttpResponse().getAllHeaders()) {
      responseHeaders += header.getName() + ": " + header.getValue() + "; ";
    }

    System.out.println("Request HTTP Headers : "+requestHeaders);
    System.out.println("Response HTTP Headers : "+responseHeaders);
  }
});

wsTemplate.setInterceptors(interceptors);
{% endhighlight %}
