---
layout: post
title: "How to export a Wunderlist list to JSON"
categories: [tech]
---

Here is a way to "export" a Wunderlist list as a JSON Array:

* Open your favorite and up to date browser
* Login into [Wunderlist](https://www.wunderlist.com)
* Select one of your list
* Open your browser Developer Console
* Type: ```Array.from(document.getElementsByClassName("taskItem-titleWrapper-title")).map(item => item.innerHTML)``` and press Enter
* Right click on the printed object then click on "Copy Object"

That's it! 

As it's based on the CSS Class name of a list item it might change in the future, if that does not work just check what is the new CSS class.

Tested with Firefox 67.0.1, on June 13th 2019.