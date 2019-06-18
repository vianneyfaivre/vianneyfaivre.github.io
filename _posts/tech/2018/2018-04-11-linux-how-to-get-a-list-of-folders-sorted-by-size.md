---
layout: post
title: "Linux: how to get a list of folders sorted by size"
categories: [tech]
---
To get the list of folders of a specific folder sorted by size, use the command "du" (disk usage)

For example if you want to list the folders of "/home" sorted by size:
{% highlight java %}du -sh /home/* | sort -h{% endhighlight %}

Example of output:
{% highlight java %}
153K    /home/michel
272M    /home/julien
18G     /home/vianney
{% endhighlight %}
