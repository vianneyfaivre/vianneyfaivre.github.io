---
layout: post
title: "How to use SNAPSHOT dependencies with Maven Release Plugin"
categories: [tech]
---

You might want to release a project even though you have SNAPSHOT dependencies in your project.

If you are using the maven release plugin, you will face this error: "Can't release project due to non released dependencies"

The solution is to set the flag allowTimestampedSnapshots to true in the plugin configuration

{% highlight xml %}
<plugin>
   <groupId>org.apache.maven.plugins</groupId>
   <artifactId>maven-release-plugin</artifactId>
   <version>2.5.2</version>
   <configuration>
      <pushChanges>false</pushChanges>
      <localCheckout>true</localCheckout>
      <allowTimestampedSnapshots>true</allowTimestampedSnapshots>
   </configuration>
</plugin>
{% endhighlight %}

Tested with `Maven 3.3.9` and `maven-release-plugin 2.5.2`