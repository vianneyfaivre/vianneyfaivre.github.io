---
layout: post
title: "Liferay 6: How to get categories from a vocabulary"
categories: [tech]
---
Here is a simple snippet that let you get all categories from a vocabulary. A vocabulary is always pinned to a group (either a simple group or to the global group of a company).
<!--more-->

{% highlight java %}
// Get vocabulary "vocabulary.my-voc" (from myGroup)
AssetVocabulary vocabulary = AssetVocabularyLocalServiceUtil.getGroupVocabulary(myGroup.getGroupId(), "vocabulary.my-voc");

// Get all categories from vocabulary "vocabulary.my-voc"
List<AssetCategory> categories = AssetCategoryLocalServiceUtil.getVocabularyCategories(vocabulary.getVocabularyId(), QueryUtil.ALL_POS, QueryUtil.ALL_POS, null);
{% endhighlight %}

NB: you can use method "getVocabularyRootCategories" to get the level-0 categories of your vocabulary.
