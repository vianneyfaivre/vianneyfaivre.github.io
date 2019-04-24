---
layout: post
title: "Liferay 6: HSQL default database"
categories: [tech]
---
When you first get the Liferay bundle, the database configured by default is HSQL (Hyper SQL).

It’s a very simple database engine that could be either in-memory or disk based. In the Liferay bundle it’s configured to be used as a disk based database.

The database files are located at "<liferay home folder>/data/hsql/portal" (default value).

Some data already exists in this DB, it lets you have a running Liferay instance once the Liferay bundle downloaded.

<!--more-->

<h3><b>JDBC configuration in Liferay bundle</b></h3>

The JDBC configuration could be found in the file portal.properties:

jdbc.default.driverClassName=org.hsqldb.jdbcDriver
jdbc.default.url=jdbc:hsqldb:${liferay.home}/data/hsql/lportal
jdbc.default.username=sa
jdbc.default.password=

<h3><b>How to manage your HSQL database</b></h3>

A very simple tool is provided in "hsql.jar", it lets you basically manage your database (querying, tables creating/altering, …). You JAR file is located in your Liferay bundle.

You will surely love it, it’s a Java Swing application! :)

To launch it, execute the following command:

{% highlight shell %}java -cp hsql.jar org.hsqldb.util.DatabaseManagerSwing{% endhighlight %}
