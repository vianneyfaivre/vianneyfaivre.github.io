---
layout: post
title: "Liferay : Create a Spring MVC Portlet + Thymeleaf"
categories: [tech]
---
<h2>Why ?</h2>

I work on various Liferay projects, we often use Liferay/Spring Portlet MVC + JSP technologies. I’m tired of using JSP, I won’t explain why, there are a lot of its drawbacks described on the Internet.

I know that it’s possible to make "almost good" JSPs without any Java scriptlet, but it’s boring and the final JSP content is kind of a mess. Taglib system is too heavy and too boring to maintain. The only thing I like in JSP is EL (Expression Language) syntax.

So what’s next ? I just want to use a simple templating system with a nice syntax and without the ability to write pure Java. I want a clear separation between business logic and view logic, <strong>I want the V of MVC</strong>.

<!--more-->

Edouard, a friend of mine, started <a href="http://puka.fr" target="_blank">his own business</a> a few months ago. We often have discussions about tech stuff, for the view part of his software he used Thymeleaf.

Thymeleaf templates are 100% valid HTML, you can ask a designer to build the UI he wants, then you would have to add some technical information to have the final rendering. The syntax is nice (EL syntax is valid), it’s easy to integrate with Spring, the documentation is pretty clear. This seems to be a good candidate.

<h2>So what’s next ?</h2>

After all the discussions &amp; searchings, I decided to try to bootstrap a basic Spring + Thymeleaf Liferay portlet.

There are few tutorials about <a href="http://www.thymeleaf.org/doc/articles/springmvcaccessdata.html" target="_blank">Spring+Thymeleaf</a> on <a href="http://www.thymeleaf.org/documentation.html" target="_blank">Thymeleaf’s documentation</a>. To be sure that Thymeleaf can be used in Liferay, I created a simple portlet that cover these portlet phases : Action, Render and Resource. <strong><a href="https://github.com/vianneyfaivre/liferay-thymeleaf-portlet" target="_blank">I hosted the code on my Github account</a></strong>.

<h2>Common questions</h2>

<h3>Liferay heavily uses taglibs, how can I use them in Thymeleaf?</h3>

You can’t use them anymore, taglibs are for JSP.
After all, taglibs are based on java so it’s possible to migrate the important taglibs (like the ones that creates render/action/resource URLs).
<a href="http://www.thymeleaf.org/doc/tutorials/2.1/extendingthymeleaf.html">Thymeleaf extending system is pretty cool</a>, there is some time to spend to get back the important taglibs but it’s doable.

<h3>People are used to JSP syntax, how can I tell them to use Thymeleaf ?</h3>

This is the first time that I’m using Thymeleaf, as of now I can say that it’s far easier to read compared to JSP. You can reuse EL syntax in those templates thus developers won’t get totally lost :)

<h2>Conclusion</h2>

This first attempt is pretty basic but it is working fine, there are a lot of pending topics to work on so that Thymeleaf could be fully usable in a real Liferay use case.

Soon I’ll have a real portlet to work on, I’ll try to push the use of Thymeleaf. Then, I’ll see if it has been a good idea or not.

I’ll keep you updated!

<h2>Useful links</h2>

http://docs.spring.io/autorepo/docs/spring/4.2.5.RELEASE/spring-framework-reference/html/portlet.html
http://www.thymeleaf.org/doc/tutorials/2.1/thymeleafspring.html
