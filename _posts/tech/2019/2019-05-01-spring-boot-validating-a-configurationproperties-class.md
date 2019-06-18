---
layout: post
title: "Spring Boot: Validate a @ConfigurationProperties class"
categories: [tech]
---

In Spring Boot you can use all JSR-303 Validation API by default (`javax.validation.*`)

If you want to implement custom validation, just implement the interface `org.springframework.validation.Validator`

{% highlight java %}
@Configuration
@Validated
@ConfigurationProperties("myproperties")
public class MyProperties implements Validator {

    @Max(100)
    private int size;

    private String custom;

    @Size(min=2, max=5)
    private List<String> stuff;

    @Override
    public boolean supports(Class<?> clazz) {
        return MyProperties.class.isAssignableFrom(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
        MyProperties props = (MyProperties) target;

        if(target.getCustom().split("||").length > 2) {
            errors.rejectValue("custom", "", "Value '" + target.getCustom() + "' is not valid according to my business rule");
        }
    }
	
    // TODO Getters and setters ...
}
{% endhighlight %}

NB: here is a properties file that matches with the java class

{% highlight properties %}
myproperties.size=50
myproperties.custom=bla||bla||blabla
myproperties.stuff=a1,a2,a3
{% endhighlight %}
 
Tested with Spring Boot 2.1.4