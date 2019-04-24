---
layout: post
title: Simple template for application documentation
categories: [tech]
---
Here is a template I use to document web applications, web services and microservices.

It has to give all the information so a person who is new to that application can understand it and can start working on it. However it should not be too long otherwise people won't read it or maintain it. You have to keep it simple.

<!--more-->

It will not contain too much of technical information, the developer will find it in the source code of the application (ex: in a README.md)

Sections:

<ul>
<li><strong>Overview</strong>: a one liner that describes what this application does and who uses it</li>
<li><strong>Features</strong>: the complete list of features (each feature = one line, can be written as user stories)</li>
<li><strong>Source Code</strong>: Where to checkout the source code</li>
<li><strong>Environments</strong>: URLs and ports that are opened. Describe the use of each port and the protocol that has to be used (ex: HTTPS 1800 main application entrypoint, HTTP 6900 monitoring, etc.)</li>
<li><strong>Functional Details</strong>: what are the main entities this application uses? what are the possible values for some specific fields? Also explain and define the main topics that will be discussed when working on this application (acronyms, business terms, etc.), it can be written like a glossary. UML can also be used (if it is simpler than words, like a sequence diagram that explains a complex feature). External documentation can be referenced here.</li>
<li><strong>How to deploy the application</strong>: in test and prod environments. Specify about CI/CD environments. If prod deployments are not automated, describe carefully the procedure to follow.</li>
<li><strong>Monitoring</strong>: what are the endpoints used to monitor the application? How could I know that an application runs properly?</li>
<li><strong>Dependencies "uses"</strong>: what uses this application? Any database, application, files that is used by this application should be listed.</li>
<li><strong>Dependencies "used by"</strong>: who uses this application? Any kind of user or application that uses this application should be listed.</li>
<li><strong>Entrypoints</strong>: list of entrypoints of the application: URL + port + short description (can be replaced by doc-in-code URL, like Swagger)</li>
<li><strong>Samples</strong>: for web services, a table with each HTTP request and possible HTTP responses (including HTTP 4xx and HTTP 5xx errors). It can also be replaced by a Swagger-like documentation.</li>
<li><strong>How to run tests</strong>: script to run to ensure that the application is working properly. Also include performance tests scripts location and how to run them.</li>
</ul>
