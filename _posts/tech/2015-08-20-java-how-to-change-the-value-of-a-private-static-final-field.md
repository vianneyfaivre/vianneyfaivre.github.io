---
layout: post
title: "Java: How to change the value of a private static final field"
categories: [tech]
---
Previously I was working on a project with a lot of legacy code, one of my goals was to test parts of the "API", in some cases I had to change the value of a "private static final" field.

I had to do this because this field was initialized by a JVM argument. It was initialized once when this class has been loaded, then it wasn’t modifiable anymore.
<!--more-->
Using basic Java code it’s impossible to change this value, you have to use <strong>Java Reflection API</strong>. Let’s imagine you want to modify the value of the following field:

{% highlight java %}
// We won't test directly on Math.PI because it's a primitive var (double) 
// => so the JVM inlined it
private static final Double PI = Double.valueOf(Math.PI);
{% endhighlight %}

This field is declared in the class "Test", here is the method that let us modify this const variable :
{% highlight java %}
public static void changePiValue(double newValue) {

  Field myConstField = null;
  try {
    // Get "Field" instance of field "Test#PI"
    myConstField = Test.class.getDeclaredField("PI");

    // Change its visibility to "public"
    myConstField.setAccessible(true);

    // Get "Field" instance of "modifiers" field of "Math#PI"
    // "modfiers" is a private int that describe the visibility of the field (see java.lang.reflect.Modifier class)
    Field modifiersField = Field.class.getDeclaredField("modifiers");

    // Change its visibility to "public" (this one is private, without that line we can't change its value)
    modifiersField.setAccessible(true);

    // Remove the bit that describes the field as "final"
    // sysout this to see the human-friendly modifiers of the field : Modifier.toString(myConstField.getModifiers())
    modifiersField.setInt(myConstField, myConstField.getModifiers() &amp; ~Modifier.FINAL);

    // Set the new value into the field
    myConstField.set(null, newValue);
  } catch (Exception e) {
    e.printStackTrace();
  }
}
{% endhighlight %}

Here is the result when calling the above method:
{% highlight java %}
System.out.println("Old: "+Test.PI); // ==> Old: 3.141592653589793
changePiValue(2.0);
System.out.println("New: "+ Test.PI); // ==> New: 2.0
{% endhighlight %}

In general that's not a good practice to use that kind of code, I had to use it because:

<ul>
<li>I could not change the legacy code</li>
<li>for unit testing purposes so no impact on real code</li>
<li>I like to use the reflection API :)</li>
</ul>
