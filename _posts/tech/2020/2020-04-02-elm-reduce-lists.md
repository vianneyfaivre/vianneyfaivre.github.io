---
layout: post
title: "Elm - How to reduce lists"
categories: [tech]
---

It's very easy to reduce lists in Elm, here is an example using Elm REPL.

{% highlight javascript %}
> List.foldl String.append "" ["a", "b", "c"]
"cba"
{% endhighlight %}

This one is a clean equivalent of that dirty one: `String.append "c" (String.append "b" (String.append "a" ""))`

Same one but going from the right:

{% highlight javascript %}
> List.foldr String.append "" ["a", "b", "c"]
"abc"
{% endhighlight %}

Tested with Elm 0.19.1