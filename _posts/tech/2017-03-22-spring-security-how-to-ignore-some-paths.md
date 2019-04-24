---
layout: post
title: "Spring security: how to ignore some paths"
categories: [tech]
---
Here is the way to configure Spring Security to tell him to ignore some paths. It could be useful when you need to have public APIs or make static resources public.

{% highlight java %}
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	
	@Override
 	public void configure(WebSecurity web) throws Exception {
 		web.ignoring().antMatchers("/static/**");
 	}
}
{% endhighlight %}

Spring boot: 1.3.3.RELEASE

Spring Security: 4.0.3.RELEASE