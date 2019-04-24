---
layout: post
title: Spring MVC exception handling
categories: [tech]
---
<h2>How to handle exceptions thrown by Spring MVC Controllers</h2>

In your controllers you (may) have code that throws exceptions, some of them are thrown in order to tell you that you should display an error to the user (I’m not talking about unexpected runtime exceptions :) ).

Imagine that you use that piece of code in three different Spring controllers, you have to handle this exception three times.

Instead of doing that, you can let the exception go (by adding a throws clause in your method signature) and handle the exception differently, using a method annotated with @ExceptionHandler.
<!--more-->
Here you go :

<ul>
    <li>Controller layer</li>
</ul>

<p style="padding-left:30px;">Declare a method in your Spring controller (or use a controller-assistant-class by defining a class annotated with @ControllerAdvice)</p>

<p style="padding-left:30px;">This method will be called each time a "MyException" exception is thrown.</p>

{% highlight java %}
@ExceptionHandler(MyException.class)
public ModelAndView handleMyException(MyException exception) {
    // Always log exceptions
    LOGGER.error(exception);
    
    // Path to your JSP
    ModelAndView modelAndView = new ModelAndView("my-custom-folder/error");
    
    // Add info in the model, for instance a custom error message
    modelAndView.addObject("errorMessage", "Ooops something went wrong.");
    
    return modelAndView;
}
{% endhighlight %}

<ul>
    <li>View layer</li>
</ul>

<p style="padding-left:30px;">Create the file "error.jsp" under the folder "WEB-INF/jsp/my-custom-folder". Use this JSP to display your beautiful error to the user.</p>

<p style="padding-left:30px;">You can use every piece of data you put in your model, in this example you can display the message set in the variable "errorMessage"</p>

Et voila! Now when a MyException is thrown the user will always be redirected to the JSP error.jsp.
