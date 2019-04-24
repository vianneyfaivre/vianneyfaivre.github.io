---
layout: post
title: How to test port availability using telnet
categories: [tech]
---
Let's say you want to know if the port 4567 is available on your linux machine, you can use the following piece of code:

{% highlight shell %}
if [[ $(exit | telnet localhost 4567 | grep "Connected to") == "Connected to"* ]]; then
   echo "Port 4567 is not available"
   exit 1
fi
{% endhighlight %}
