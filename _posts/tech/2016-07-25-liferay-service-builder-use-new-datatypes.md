---
layout: post
title: "Liferay Service Builder : Use new datatypes"
categories: [tech]
---
Liferay Service Builder let you easily generate lot of service classes that give you access to your database. It’s pretty useful when you have basic needs and want to generate basic Java service layer (CRUD + finders).

(nowadays using Hibernate (without Service Builder) should be the best option when working with non-Liferay tables)

But it still has lot of drawbacks (in my opinion), one of them is that there are not a lot of types that can be used for column types.

<!--more-->

<h3>Simple example</h3>

Let’s say you get a table named "Car_Price", pretty dumb table: each car has a price.

Three columns in your table:
* `carPriceId` : `BIGINT` (PK)
* `carId` : `BIGINT` (id of the car)
* `price` : `DECIMAL(9, 2)`

Very stupid table, no currency, no other fields. 
Now let’s use Liferay Service Builder to generate the service layer for this table.

In a first attempt you might want to try to write this:

{% highlight xml %}
<entity name="CarPrice" local-service="true" remote-service="false">
  <column name="carPriceId" type="long" primary="true" />
  <column name="carId" type="long" />
  <column name="price" type="BigDecimal" />
</entity>
{% endhighlight %}

Or

{% highlight xml %}
<entity name="CarPrice" local-service="true" remote-service="false">
  <column name="carPriceId" type="long" primary="true" />
  <column name="carId" type="long" />
  <column name="price" type="java.math.BigDecimal" />
</entity>
{% endhighlight %}

(Don’t use double &amp; float data types for mapping decimal fields from SQL to Java, <a href="http://stackoverflow.com/questions/3730019/why-not-use-double-or-float-to-represent-currency">here is why</a>)

When building Java services you’ll get this error:

```
Error on line 93, column 33 in com/liferay/portal/tools/servicebuilder/dependencies/model_impl.ftl
serviceBuilder.getSqlType(packagePath + ".model." + entity.getName(), column.getName(), column.getType()) is undefined.
It cannot be assigned to sqlType
The problematic instruction:
----------
==> assignment: sqlType=serviceBuilder.getSqlType(packagePath + ".model." + entity.getName(), column.getName(), column.getType()) [on line 93, column 33 in com/liferay/portal/tools/servicebuilder/dependencies/model_impl.ftl]
----------
```

Let’s have a look to lhe line 93 of file "model_impl.ftl" :

```
<#assign sqlType = serviceBuilder.getSqlType(packagePath + ".model." + entity.getName(), column.getName(), column.getType())>
```

The specified type "BigDecimal" does not exist in list of available types in Liferay Service Builder, thus it’s not usable from service.xml.

<h3>Simple solution</h3>

Here is a simple solution to "use" our custom type in Service Builder API.

You can create new methods in CarImpl.java that will be available further when manipulating Car entities.

<strong>Steps</strong>:

<ul>
<li>Declare your field "price" as a "String" in service.xml </li>
<li>In CarImpl.java, create a method with following signature:</li>
</ul>

{% highlight java %}
public BigDecimal getPrice() {
    return NumberUtils.createBigDecimal(super.getPrice());
}
{% endhighlight %}

<ul>
<li>In CarImpl.java, override old getPrice method and set it as deprecated:</li>
</ul>

{% highlight java %}
/**
 * Use the method #getPrice() that returns a BigDecimal instead.
 */
@Override @Deprecated
public String getPrice() {
    return super.getPrice();
}
{% endhighlight %}

<ul>
<li>Rerun service builder, your new methods will be available from all Car entities! Setting the original getPrice method as deprecated is just to tell developers not to use this method (it's deprecated but still it has to have the same implementation as before, otherwise you will encounter issues)</li>
</ul>

<h3>Complex way</h3>

If you have more time you can still improve the service builder itself: [see here](https://web.liferay.com/fr/web/jonas.yuan/blog/-/blogs/bringing-data-type-bigdecimal-into-service-builder)

Otherwise you can stop using it for your custom tables and use Hibernate by yourself :)
