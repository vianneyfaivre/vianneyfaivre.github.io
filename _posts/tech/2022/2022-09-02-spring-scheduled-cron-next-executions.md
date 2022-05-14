---
layout: post
title: "Spring - @Scheduled - How to get CRON next executions"
categories: [tech]
---

Here is a simple snippet that let you know the next time your `@Scheduled` annotated method will run.

{% highlight java %}

// Sample for a @Scheduled(cron = "0 59 23 * * 7")

// seconds minutes hours day-of-month months day-of-week
String cronExpr = "0 59 23 * * 7";

CronSequenceGenerator cronTrigger = new CronSequenceGenerator(cronExpr);
Date exec1 = cronTrigger.next(new Date());
Date exec2 = cronTrigger.next(exec1);

System.out.println("Next execution: " + exec1);
System.out.println("Next execution: " + exec2);
{% endhighlight %}

Tested with Spring Boot `2.2.13.RELEASE` (Quartz version: `2.3.2`)