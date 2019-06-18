---
layout: post
title: Eclipse does not lookup to the right code version while debugging
categories: [tech]
---
If you debug some code on a project where you have multiple versions in your workspace, eclipse may lookup for the wrong class.

To tell eclipse which project to search for, go to:

* `Run > Debug Configurations...`
* Click on your debug configuration
* Go to `Source` tab
* In `Source Lookup Path` panel:
  * remove `Workspace` entry
  * add the version of your project you want eclipse to search for