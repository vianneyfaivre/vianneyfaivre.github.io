---
layout: post
title: "Javascript: one liner for formatting JSON"
categories: [tech]
---
I use this bookmarklet to format plain JSON returned by whatever webservice.

{% highlight javascript %}javascript:(function(){document.body.innerHTML=JSON.stringify(JSON.parse(document.body.textContent), null, 4);document.body.style='white-space: pre;font-family:monospace';})(){% endhighlight %}

(nb: I could have installed a browser extension, but I don't have the rights to do so in this machine)
