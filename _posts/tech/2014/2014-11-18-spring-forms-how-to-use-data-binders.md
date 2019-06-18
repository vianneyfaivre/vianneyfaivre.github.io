---
layout: post
title: "Spring Forms: How to use data binders"
categories: [tech]
---
<h2>What is a data binder ?</h2>

Spring MVC uses Java beans for form modeling, it lets you create forms that have statically typed fields. Instead of retrieving a form in plain text, Spring does automatically the mapping between your HTML form and your Java Bean, even if the types are not only "String".

The mechanism behind this is simple, by default Spring has registered a lot of data binders for common types (Integer, BigDecimal, Enum, etc.). For each HTML field binded to a Java Bean, Spring will look for the correct binder to use and will do the conversion.
<!--more-->
The binding between the HTML form and the Java Bean is done thanks to the Spring taglib "form".

If you create a custom Java type and if you want to use in a HTML form, you should register a new data binder.

<h2>Example of use : Change the default data binder for the BigDecimal class</h2>

During a project I faced a problem with the default BigDecimal data binder, it does not allow the comma as decimal separator (by default it uses a dot).

In France we mainly use the comma, but it could be great if the dot could be used too. In order to allow the user to use these two characters, I created a specific data binder that replace each dot with a comma (we do not use thousand separator in France).

The following snippet contains the declaration of the binder, it should be put in the controller called at the submitting of your HTML form.

In this example I used Spring Web 3.2.

{% highlight java %}
@InitBinder
public void bigDecimalCustomBinder(WebDataBinder binder) {
	final DecimalFormat FORMATTER = (DecimalFormat) NumberFormat.getNumberInstance(Locale.FRANCE);

	// Allow the HTML field to be empty without generating any exception
	boolean allowEmptyValue = true;

	// Creation of a new binder for the type "BigDecimal"
	CustomNumberEditor binder = new CustomNumberEditor(BigDecimal.class, new NumberFormat() {

		private static final long serialVersionUID = 1L;

		@Override
		public Number parse(String source, ParsePosition parsePosition) {
			if (source != null) {
				source = source.replace('.', ',');
			}
			return FORMATTER.parse(source, parsePosition);
		}

		@Override
		public StringBuffer format(long number, StringBuffer toAppendTo, FieldPosition pos) {
			return FORMATTER.format(number, toAppendTo, pos);
		}

		@Override
		public StringBuffer format(double number, StringBuffer toAppendTo, FieldPosition pos) {
			return FORMATTER.format(number, toAppendTo, pos);
		}
	}, allowEmptyValue);

	// Registration of the binder 
	binder.registerCustomEditor(BigDecimal.class, binder);
}
{% endhighlight %}

Et voilà! Now all the BigDecimal input fields used in our HTML form accept both comma and dot as the decimal separator character.
