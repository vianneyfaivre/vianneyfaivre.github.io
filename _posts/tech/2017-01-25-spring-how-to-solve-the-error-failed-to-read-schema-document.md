---
layout: post
title: "Spring: How to solve the error Failed to read schema document"
categories: [tech]
---
I have worked on migrating an Ant project to Maven that has a couple of XML Spring configuration files.

When deploying I got the error `Failed to read schema document http://www.springframework.org/schema/security/spring-security-3.1.xsd` because Spring was not able to find the XSD file when parsing one of my XML files.

<!--more-->

Here is the solution: <strong>you are missing a dependency that contains the XSD file</strong>.

Spring puts XSD files in folder `META-INF/spring.schemas`, you just have to find the dependency that contains this file, and quickly check if the XSD you miss is mentioned.

In my case the XSD file for spring-security-3.1 is located into artifact "spring-security-config".
