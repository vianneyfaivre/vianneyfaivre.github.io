---
layout: post
title: "Java - Aspect Oriented Programming - How to define a pointcut on a particular annotation"
categories: [tech]
---

It's easy to inject code around any specific piece of code by using Aspect Oriented Programming.

Here is an example on how to define a pointcut before and after an annotated method is being called.

{% highlight java %}
@Aspect
public class LogStatsAspect {

    @Around("@annotation(path.to.your.AnnotationToWatch)")
    public Object logIncomingApiCalls(ProceedingJoinPoint joinPoint) throws Throwable {

        if(hasAnnotation(joinPoint, AnnotationToWatch.class)) {
            System.out.println("This method was called: " + joinPoint.getSignature().toShortString());
        }

        // Actual method call. Time spent in that method could be measured
        return joinPoint.proceed();
    }

    private <T> boolean hasAnnotation(ProceedingJoinPoint joinPoint, Class<T> annotation) throws NoSuchMethodException {

        // Double check that the annotation has been used on a method and not on something else
        // This is not necessary if you have configured your annotation to be only usable on Methods
        if(!(joinPoint.getSignature() instanceof MethodSignature)) {
            return false;
        }

        MethodSignature methodSignature = (MethodSignature) joinPoint.getSignature();

        // Get the name of the method that is being called
        String methodName = methodSignature.getMethod().getName();
        Class<?>[] parameterTypes = methodSignature.getMethod().getParameterTypes();

        // Get the method that is being called, then get the list of annotations declared on that one
        Annotation[] declaredAnnotations = joinPoint.getTarget().getClass().getMethod(methodName, parameterTypes).getDeclaredAnnotations();

        // Search for the annotation that we are looking for
        return Arrays.stream(declaredAnnotations)
                     .map(Annotation::annotationType)
                     .anyMatch(type -> type.isAssignableFrom(annotation));
    }
}
{% endhighlight %}