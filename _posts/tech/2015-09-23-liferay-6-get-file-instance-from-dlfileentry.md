---
layout: post
title: "Liferay 6: Get File instance from DLFileEntry"
categories: [tech]
---
Another useful and common snippet that let you get the java.io.File instance from a DLFileEntry instance:
<!--more-->
{% highlight java %}
long folderId = fileEntry.getFolderId();

// if folderId == 0 => means that this file is at the root folder of the repository
if (folderId == 0) {
    folderId = fileEntry.getRepositoryId();
}

File file = DLStoreUtil.getFile(fileEntry.getCompanyId(), folderId, fileEntry.getName(), fileEntry.getVersion());
{% endhighlight %}
