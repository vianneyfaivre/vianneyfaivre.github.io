---
layout: post
title: "How to test if a port is open"
categories: [tech]
---

You can use `netcat` aka `nc` to test if a port is open or not.

{% highlight bash %}

// Test on port 80 (open)
> nc vianneyfaivre.com 80 -v      
Connection to vianneyfaivre.com port 80 [tcp/http] succeeded!

// Test on port 81 (closed)
> nc vianneyfaivre.com 81 -v    
nc: connectx to vianneyfaivre.com port 81 (tcp) failed: Operation timed out

// Test on port 443 (open)
> nc vianneyfaivre.com 443 -v   
Connection to vianneyfaivre.com port 443 [tcp/https] succeeded!

// Bonus: get TLS info and certificates (if applicable)
> openssl s_client -connect vianneyfaivre.com:443
{% endhighlight %}