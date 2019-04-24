---
layout: post
title: How to configure Log4j 2 with a properties file
categories: [tech]
---
You may want to migrate from Log4j 1.x to Log4j 2, for example because of <a href="https://logging.apache.org/log4j/2.x/performance.html" target="_blank">performance improvements</a>.

<!--more-->

But, you don't want to rewrite all your Log4j 1.x properties file, to use them for Log4j2, you have to slightly change them.

Here is an example of Log4j 2 configuration using properties. It defines two appenders: a console appender and a rolling file appender. (<a href="https://github.com/vianneyfaivre/spring-boot-log4j2-sample" target="_blank">You can find a full working example in my Github repo</a>)

{% highlight properties %}
# Declare loggers
name=LoggingConfig
appenders=a_console, a_rolling
rootLogger.level=info
rootLogger.appenderRefs=ar_console,ar_rolling
rootLogger.appenderRef.ar_console.ref=StdoutAppender
rootLogger.appenderRef.ar_rolling.ref=DailyRollingAppender

# Console logger
appender.a_console.type=Console
appender.a_console.name=StdoutAppender
appender.a_console.layout.type=PatternLayout
appender.a_console.layout.pattern=%d{ISO8601} [%t] %-5p (%F\:%L) - %m%n

# File logger
appender.a_rolling.type=RollingFile
appender.a_rolling.name=DailyRollingAppender
appender.a_rolling.layout.pattern=%d{ISO8601} [%t] %-5p (%F\:%L) - %m%n

appender.a_rolling.fileName=log4j2-sample.log
appender.a_rolling.filePattern=log4j2-sample-%d{yyyy-MM-dd}.log

appender.a_rolling.layout.type=PatternLayout
appender.a_rolling.policies.type=Policies
appender.a_rolling.policies.time.type=TimeBasedTriggeringPolicy
appender.a_rolling.policies.time.interval=1
{% endhighlight %}

Don't hesitate to send me a message if you have any issue/question.
