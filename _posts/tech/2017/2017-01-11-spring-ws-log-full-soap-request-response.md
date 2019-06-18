---
layout: post
title: "Spring WS: log full SOAP request/response"
categories: [tech]
---
Here is a <strong>quick'n'dirty</strong> snippet I wrote to log the full content of SOAP requests/responses. Pretty useful for debugging purposes.

You can set the interceptor when creating the WebServiceTemplate object.

<!--more-->

Spring WS version : 2.2.3.RELEASE

{% highlight java %}
// import org.springframework.ws.*;
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
        try {
            System.out.println("Request :");
            messageContext.getRequest().writeTo(System.out);
            System.out.println("\nResponse : ");
            messageContext.getResponse().writeTo(System.out);
            System.out.println();
        } catch (IOException ignored) {
        }
    }
});

wsTemplate.setInterceptors(interceptors);
{% endhighlight %}
