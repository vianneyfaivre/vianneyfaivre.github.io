---
layout: post
title: "How to display which settings.xml file is used by Maven"
categories: [tech]
---
Just in case, if you need to be sure sure sure that your Maven installation use the right settings.xml file you can use the following methods:
<!--more-->

<ul>
<li>Execute the Maven goal "<strong>help:effective-settings</strong>". It will print in the console the content of the settings.xml that Maven is able to find.</li>

<li>Add the option "<strong>-X debug</strong>". It will print in the console the paths to the settings.xml that Maven have found.</li>
</ul>

```
[DEBUG] Reading global settings from U:\maven\apache-maven-3.2.1\conf\settings.xml
[DEBUG] Reading user settings from U:\maven\apache-maven-3.2.1\conf\settings.xml
```