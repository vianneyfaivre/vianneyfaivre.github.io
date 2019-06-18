---
layout: post
title: "Liferay 6: How to connect to an external database using the Service Builder"
categories: [tech]
---
It’s possible to connect the Liferay Service Builder to a database different from the Liferay DB. It could be very useful and it’s pretty simple to set up.

Here are the steps:

<ol>
    <li>Add the JDBC DB information in the portal-ext.properties file</li>
    <li>Instantiate a new datasource using Spring configuration</li>
    <li>Use the new datasource in service.xml entities</li>
</ol>

<!--more-->

<h3>1. Add the JDBC DB information in the portal-ext.properties file</h3>

In the portal-ext.properties, add the following properties to declare a new JDBC connection (called "myExternalDB" in this example) :

{% highlight properties %}
jdbc.myExternalDB.driverClassName=com.mysql.jdbc.Driver
jdbc.myExternalDB.url=jdbc:mysql://localhost:3306/db
jdbc.myExternalDB.username=root
jdbc.myExternalDB.password=root
{% endhighlight %}

<h3>2. Instantiate a new datasource using Spring configuration</h3>

Declare a new datasource in the file <strong>src/main/resources/META-INF/ext-spring.xml</strong> that points to the database you set in portal-ext.properties.

You also need to declare a custom hibernate session factory and a custom hibernate transaction manager otherwise the default datasource (Liferay) will be used for the hibernate layer.

<h3>3. Use the new datasource in service.xml entities</h3>

Let’s assume you have a very simple table called "DB_CAR" with columns:

<ul>
    <li>CAR_ID (Primary Key)</li>
    <li>CAR_NAME</li>
    <li>CAR_YEAR</li>
</ul>

In the service.xml you should do the matching between the service layer you are going to generate and the existing table by names.

{% highlight xml %}
<entity
    name="Car"
    table="DB_CAR"
    local-service="true"
    remote-service="false"
    data-source="myExternalDS"
    session-factory="myExternalSessionFactory"
    tx-manager="myExternalTransactionManager"
>
    <column name="id" db-name="CAR_ID" type="long" primary="true" />
    <column name="name" db-name="CAR_NAME" type="String" />
    <column name="year" db-name="CAR_YEAR" type="int" />
</entity>
{% endhighlight %}

Then you just have to generate the service layer and you will get access to the external database!
If you get errors, have a look to the datasource declaration, the user provided should have at least read rights on table you want to map.

That’s it! Feel free to contact me if you have any issues :)
(I used Liferay 6.1 EE in that example)
