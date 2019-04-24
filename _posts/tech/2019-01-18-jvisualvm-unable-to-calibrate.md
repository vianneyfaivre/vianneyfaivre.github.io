---
layout: post
title: "JVisualVM: Unable to calibrate"
categories: [tech]
---
<!--more-->
I came across a bug with JVisualVM (the version that comes with JDK 8), it is unable to calibrate (tested on Windows 10).

The solution is to add the following command-line parameters to jvisualvm.exe: 

```-J-Dorg.netbeans.profiler.separateConsole=true```

<a href="https://markmail.org/message/g2gefpmxfnk42cgu" rel="noopener" target="_blank">Source</a>
