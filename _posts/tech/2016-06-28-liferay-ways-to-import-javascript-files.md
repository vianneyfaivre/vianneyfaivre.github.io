---
layout: post
title: "Liferay: ways to import Javascript files"
categories: [tech]
---
In Liferay you have multiple ways to load a Javascript file. Depending on what you need to do you should use the right way.

<!--more-->

<h3>JS that is available in ALL pages</h3>

You can reuse the mechanism that Liferay uses for loading a lot of JS files at every page load.

<ul>
<li>Create a hook that will add your JS file in ROOT webapp</li>
<li>Add the path to your blabla.js file to one of those properties: 

<ul>
<li>javascript.everything.files : when user is logged in</li>
<li>javascript.barebone.files : when user is logged in / off</li>
</ul></li>
</ul>

<h3>JS that is specific to a theme</h3>

No suprises here, if you need to have some javascript depending on your theme (for example a specific visual effect related to current style), you need to put it in your theme :)

<ul>
<li>Put your blabla.js in the folder "js" of your theme</li>
<li>Import your blabla.js file in Velocity template "portal-normal.vm" using HTML "script" tag</li>
</ul>

If you need to use the JS in multiple themes, use theme inheritance mechansim.

<h3>JS that is specific to a portlet</h3>

In every portlet you will surely need to write some JS to do some client validation or some visual logic.

<ul>
<li>Put your blabla.js in the folder "js" of your portlet</li>
<li>Import the JS file at top/bottom of the portlet (depending if you need the script to be executed at the beggining/end of the displaying of the portlet page)</li>
</ul>

Side note: always try to avoid inline Javascript in your HTML.
