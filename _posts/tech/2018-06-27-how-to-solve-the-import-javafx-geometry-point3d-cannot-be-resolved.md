---
layout: post
title: "How to solve: The import javafx.geometry.Point3D cannot be resolved"
categories: [tech]
---
Since JDK 8, the Java FX libraries are not included into the standard library (OpenJDK).

To add JavaFX jar files into jre/lib/ext you have to run the following command: {% highlight java %}sudo apt-get install openjfx{% endhighlight %}

Tested with OpenJDK 1.8.0_151 on Linux 3.10.0-693.11.6.el7.x86_64 (Debian GNU/Linux 9.3)
