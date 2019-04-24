---
layout: post
title: "Liferay 6: how to get web contents by category"
categories: [tech]
---
Below is the Java snippet to get the list of web contents which belong to a specific category.

<!--more-->

{% highlight java %}
public List<JournalArticle> getArticlesByCategory(AssetCategory category) throws SystemException {

  // Build query
  AssetEntryQuery query = new AssetEntryQuery();
  query.setAllCategoryIds(new long[] { category.getCategoryId() });
  query.setExcludeZeroViewCount(false);

  // Run query
  List<AssetEntry> assets = AssetEntryLocalServiceUtil.getEntries(query);

  // Build result
  List<JournalArticle> result = new ArrayList<JournalArticle>();
  for (AssetEntry asset : assets) {
    try {
      result.add(JournalArticleLocalServiceUtil.getLatestArticle(asset.getClassPK(), WorkflowConstants.STATUS_APPROVED));
    } catch (PortalException ignored) {
      // happens if the asset has no JournalArticle associated ==> should not happen
    }
  }

  return result;
}
{% endhighlight %}
