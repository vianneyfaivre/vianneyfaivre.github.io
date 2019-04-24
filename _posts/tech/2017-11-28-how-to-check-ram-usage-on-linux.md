---
layout: post
title: How to check RAM usage on Linux
categories: [tech]
---
Memory usage + total:

{% highlight shell %}free -mh{% endhighlight %}

List of processes and their memory consumption:

{% highlight shell %}ps aux  | awk '{print $6/1024 " MB\t" $2 "\t" $11}' | sort -n{% endhighlight %}

Column 1: Memory consumption (MB)

Column 2: PID

Column 3: Command that ran the process
