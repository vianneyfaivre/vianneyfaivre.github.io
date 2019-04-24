---
layout: post
title: "How to cache font files with Apache HTTP server"
categories: [tech]
---
Font files are not often updated, you can cache it for a looooong time.

Here are a piece of Apache configuration that adds some cache HTTP headers when a font files is sent to a client.

<!--more-->

{% highlight apache %}
# Cache configuration
<IfModule mod_expires.c>

    # Activate mod
    ExpiresActive On
    
    # Declare fonts content-type
    AddType application/vnd.ms-fontobject .eot
    AddType application/x-font-ttf .ttf
    AddType application/x-font-opentype .otf
    AddType application/x-font-woff .woff
    AddType image/svg+xml .svg
    
    # Set cache duration
    ExpiresByType application/x-font-woff "access plus 1 years"
    ExpiresByType application/x-font-ttf "access plus 1 years"
    ExpiresByType application/vnd.ms-fontobject "access plus 1 years"
    ExpiresByType application/svg+xml "access plus 1 years"
    
    # Append "public" to header "Cache-Control"
    <IfModule mod_headers.c>
        Header append Cache-Control "public"
    </IfModule>
</IfModule>
{% endhighlight %}

You want more details about HTTP Header "Cache-Control" ?? There you go: <a href="https://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.9" target="_blank">W3C documentation</a>
