---
layout: post
title: How to force Git to use LF instead of CRLF
categories: [tech]
---
For some reasons you may want to change all line endings of your text files to LF instead of CRLF, here is how to do it.

<!--more-->

<h3>1. Create a .gitattributes file at the root of your project</h3>

Specify the files that you want end of line (eol) to change by using regex.

Here is a sample file for a Java project:

```
# Handle line endings automatically for files detected as text
# and leave all files detected as binary untouched.
* text=auto

#
# The above will handle all files NOT found below
#
# These files are text and should be normalized (Convert crlf => lf)
*.css           eol=lf
*.df            eol=lf
*.htm           eol=lf
*.html          eol=lf
*.java          eol=lf
*.js            eol=lf
*.json          eol=lf
*.jsp           eol=lf
*.jspf          eol=lf
*.jspx          eol=lf
*.properties    eol=lf
*.sh            eol=lf
*.tld           eol=lf
*.txt           eol=lf
*.tag           eol=lf
*.tagx          eol=lf
*.xml           eol=lf
*.yml           eol=lf

# These files are binary and should be left untouched
# (binary is a macro for -text -diff)
*.class         binary
*.dll           binary
*.ear           binary
*.gif           binary
*.ico           binary
*.jar           binary
*.jpg           binary
*.jpeg          binary
*.png           binary
*.so            binary
*.war           binary
```

<h3>2. Remove all project files</h3>

{% highlight shell %}git rm --cached -rf /path/to/your/project{% endhighlight %}

<h3>3. Re-create all files (from source tree)</h3>

{% highlight shell %}git diff --cached --name-only -z | xargs -n 50 -0 git add -f{% endhighlight %}

The above command does:

<ul>
<li>a diff between your local project and your local git repository, because you have deleted all files it will return all file names from source tree</li>
<li>read results from 'git diff' and pass the file names to 'git add' (thanks to 'xargs')</li>
<li>add back all files, and this time the EOL policy will be applied thanks to the .gitattributes file</li>
</ul>

<h3>4. Commit and push your changes</h3>

That's it!
