---
layout: post
title: SVN monitoring software
categories: [tech]
---
Since february I’m working on a big Liferay portal that implies a lot of people from a lot of locations: China, India, Malaysia, USA, Singapore, France.

At any time there is someone who is working on the project, one role I have in this project is to review the code written by Indian developers.

There are around 80 commits a day, I need to review ~15% of them.
To be reactive and follow development to the nearest I needed to be notified when a new commit has been done.

That’s how I googled "monitor svn commits" and clicked on the first result: <a title="CommitMonitor" href="http://stefanstools.sourceforge.net/CommitMonitor.html" target="_blank">CommitMonitor</a>
<!--more-->
This little software runs in the background in Windows, it lets you monitor as many SVN repos as you want. Each x minutes a little alert window pops up if there has at least one commit done.

In my case I have declared 4 SVN repos, they are checked every ten minutes.

For each repo you can configure a lot of things like:
whitelist or blacklist some users
ignore commits by a specific log message (I didn’t try but maybe you can use regular expressions)
execute a script when new commits are detected
etc.

This software works, is easy to install/configure/use and perfectly meet my needs! That’s why I’m sharing it :)
