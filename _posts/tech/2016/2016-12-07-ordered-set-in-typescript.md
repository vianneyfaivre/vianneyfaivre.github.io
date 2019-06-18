---
layout: post
title: Ordered set in Typescript
categories: [tech]
---

I'm working on an Angular 2 project, for some reasons I needed to use an ordered set. I could have used a map but as I was discovering Angular 2 &amp; Typescript, I decided to write my own "implementation".

<!--more-->

I wrote a couple of unit tests because Javascript is kind of weird :) (using Typescript is slightly better but still, there are strange behaviors that will lead to errors during runtime)

(Typescript 2.0, Unit tests with Jasmine)

{% gist e2178cc1a7fc5662e5799c2140ebb08e %}

Unit tests:

{% gist 57dd598634140692b563d256fc6e84ab %}
