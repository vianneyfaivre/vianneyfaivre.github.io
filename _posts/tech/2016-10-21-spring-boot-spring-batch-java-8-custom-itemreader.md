---
layout: post
title: "Spring Boot + Spring Batch + Java 8 : custom ItemReader"
categories: tech
---
Simple example of using a custom ItemReader for Spring Batch, with Spring boot and Java 8.

This example describe how to run a batch where the source data is a list of files.

<!--more-->

<h3>Dependencies (using Gradle)</h3>

```
compile("org.springframework.boot:spring-boot-starter-parent:1.4.1.RELEASE")
compile("org.apache.commons:commons-lang3:3.4");
compile("commons-io:commons-io:2.5");
compile("org.springframework.boot:spring-boot-starter-batch")
```

<h3>Source data: files</h3>

Let’s have a folder that contains the list of flags of the world. The file name is the ISO 3166-2 code of a country.

![]({{ site.url }}/assets/images/spring-batch/art6.png)

First we have to create a simple bean that have two fields and one constructor :

![]({{ site.url }}/assets/images/spring-batch/art1.png)

<h3>Batch step: import flags</h3>

A batch step is composed of three main items:

<ul>
    <li>Reader : read data from source</li>
    <li>Writer : write data to destination</li>
    <li>Processor : transform an object from source into a new object</li>
</ul>

Those three objects should be instantiated in a new class :

![]({{ site.url }}/assets/images/spring-batch/art4.png)

<h3>Batch step: import flags: reader</h3>

First let's declare our reader in the class PangeaBatchStepImportFlags:

![]({{ site.url }}/assets/images/spring-batch/art9.png)

The FileReader object is a new class to create that implements ItemReader:

![]({{ site.url }}/assets/images/spring-batch/art11.png)

<h3>Batch step: import flags: writer</h3>

Our writer class does nothing complicated, it just prints to the console each item details: the ISO 3166-2 country code and the file associated.

Add the following method to the class PangeaBatchStepImportFlags:

![]({{ site.url }}/assets/images/spring-batch/art7.png)

As `ItemWriter` is a functional interface, we can simply return a lambda expression.

<h3>Batch step: import flags: processor</h3>

In our example we don't need to transform the source object into another one, so let's use a processor that returns the same object that is passed.

Add the following method to the class PangeaBatchStepImportFlags:

![]({{ site.url }}/assets/images/spring-batch/art5.png)

<h3>Main Batch class</h3>

This class is the one that will run the batch step by step. For this you have to use the annotation `EnableBatchProcessing`, declare a job factory, a step factory and the class that represents your step to execute (one step = one class).

![]({{ site.url }}/assets/images/spring-batch/art2.png)

Then, you have to declare the order of execution of the steps.

![]({{ site.url }}/assets/images/spring-batch/art3.png)

Then just run your server and you'll see that the batch job will be well executed!

Screenshot from my console:

![]({{ site.url }}/assets/images/spring-batch/art8.png)

Let me know if you got any issues!