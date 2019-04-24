---
layout: post
title: "Liferay 6 : Run a script (groovy, javascript, beanshell) using Java code"
categories: [tech]
---
Liferay supports a lot of scripting languages: beanshell, javascript, groovy, python, ruby
You can execute a script directly from Liferay administration panel or by calling a java method.

You can have access to the whole Liferay API and all API that are common to your application server (for example, classes that are put in tomcat lib/ext folder). For this you will have to pass the global classloader when executing the script.

In the following example we will execute the below Groovy script using Java.
<!--more-->

Here is the Groovy script:
{% highlight groovy %}
/*
 * Input parameters:
 * PARAMETER_1 : String : simple string variable
 * LOGGER : Log : Liferay logger 
 */
LOGGER.info("Start execution of script my_groovy_script.groovy")

// Put try catch around the whole script if you want to ignore errors
try {
   def result = "Hello " + PARAMETER_1
} catch (e) {
    LOGGER.error("Exception during execution of script : "+e)
}

LOGGER.info("End of script my_groovy_script.groovy")
{% endhighlight %}

Next, Java snippet that will execute the previous Groovy script:

{% highlight java %}
// Get Groovy script
String script = "... groovy script (file) as string ...";

// Input parameters : a simple map "String - whatever"
Map <String, Object> inputParams = new HashMap < > ();
inputParams.put("PARAMETER_1", "world !");

// You should use a proper logger so you could print some information during your script execution (avoid using standard output "out.println")
inputParams.put("LOGGER", LogFactoryUtil.getLog(ExecuteMyScript.class));

// Script execution
ScriptingUtil.exec(null, inputParams, "groovy", script, getClass().getClassLoader(),
PortalClassLoaderUtil.getClassLoader());
{% endhighlight %}
