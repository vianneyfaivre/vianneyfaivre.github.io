---
layout: post
title: "Java: Define a XmlAdapter for all fields of the same type"
categories: [tech]
---

Here is a way to globally enable a JAXB XmlAdapter class, instead of having to add the annotation `@XmlJavaTypeAdapter` in each and every field you want to convert.

The following code converts every `BigDecimal` field that is null or empty to `BigDecimal.ZERO`.

{% highlight java %}
package com.vianneyfaivre.configuration;

import javax.xml.bind.annotation.adapters.XmlAdapter;
import java.math.BigDecimal;

public class BigDecimalXmlAdapter extends XmlAdapter<String, BigDecimal> {

    @Override
    public String marshal(BigDecimal v) {
        return v != null ? v.toString() : null;
    }

    @Override
    public BigDecimal unmarshal(String v) {
        if(v == null || "".equals(v.trim())) {
            return BigDecimal.ZERO;
        }
        return new BigDecimal(v.trim());
    }

}
{% endhighlight %}
 
Create a `package-info.java` file in the package that contains your JAXB POJO classes.

{% highlight java %}
@XmlJavaTypeAdapters({
    @XmlJavaTypeAdapter(value = BigDecimalXmlAdapter.class, type = BigDecimal.class)
})
package com.vianneyfaivre.model;

import com.vianneyfaivre.configuration.BigDecimalXmlAdapter;

import javax.xml.bind.annotation.adapters.XmlJavaTypeAdapter;
import javax.xml.bind.annotation.adapters.XmlJavaTypeAdapters;
import java.math.BigDecimal;
{% endhighlight %} 