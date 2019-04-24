---
layout: post
title: "Liferay 6: Get DLFileEntry download URL"
categories: [tech]
---
Just below a very useful snippet, it generates the download/preview URL of a document from Liferay document library.
<!--more-->
{% highlight java %}
// Get file entry from DB (here we get it by its AssetEntry instance)
FileEntry fileEntry = DLAppServiceUtil.getFileEntry(assetEntry.getClassPK());

// Get last version of the file entry
FileVersion fileVersion = fileEntry.getFileVersion();

// Get ThemeDisplay instance 
ThemeDisplay themeDisplay = (ThemeDisplay) renderRequest.getAttribute(WebKeys.THEME_DISPLAY);

// If you want to add additional GET parameters you can modify this var
String queryString = "";

// Append the requested file version as GET parameter
boolean appendFileEntryVersion = true;

// Choose to prefix or not the URL by the portal URL
boolean useAbsoluteURL = true;

// Compute the download URL of the file entry 
String dlURL = DLUtil.getPreviewURL(fileEntry, fileVersion, themeDisplay, queryString, appendFileEntryVersion, useAbsoluteURL);
{% endhighlight %}
