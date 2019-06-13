---
layout: post
title: "Spring Boot: How to handle RestTemplate exceptions"
categories: [tech]
---

Handling exceptions coming from your RestTemplate instances is important because they are subclasses of RuntimeException so if you don't catch them they will be thrown up to your top layer (let's say a @RestController layer).

To handle those exceptions you can catch them in a @ControllerAdvice error handler.

Here is a way to handle RestTemplate exceptions, in this example the application have multiple RestTemplate instances that calls different APIs.

### List the APIs you call in an enum

First let's define an enum that will list all the downstream APIs you will call using RestTemplate. 

This enumeration will be used for logging purposes, so that when you catch an exception you can log (or do whatever you want) that an error happened when calling that downstream API.

{% highlight java %}
public enum DownstreamApi {
  MY_API_1,
  MY_API_2
  // TODO list all the downstream APIs here
}
{% endhighlight %}

### Custom RestTemplate error handling

When using a RestTemplate, the default error handling will throw an exception when the call returned a HTTP 4xx or HTTP 5xx.

The goal here is to convert each HTTP 4xx and HTTP 5xx to a custom RuntimeException.

This custom exception will hold information about the downstream API, the HTTP response status and an error message.

{% highlight java %}
public class MyRestTemplateException extends RuntimeException {

  private DownstreamApi api;
  private HttpStatus statusCode;
  private String error;

  public MyRestTemplateException(DownstreamApi api, HttpStatus statusCode, String error) {
    super(error);
    this.api = api;
    this.statusCode = statusCode;
    this.error = error;
  }
  
  // TODO getters ... 
  // TODO toString ...
}
{% endhighlight %}

Here is the code that will catch every HTTP 4xx and 5xx errors thrown by RestTemplate when calling the API "MY_API1".

You should create a custom error handler per API so you can handle them in a different way (for example if they have different error responses you can parse it here and provide more information in your "global" exception MyRestTemplateException.java).

{% highlight java %}
public class MyApiRestTemplateErrorHandler extends DefaultResponseErrorHandler {

  @Override
  public void handleError(ClientHttpResponse response) throws IOException {
    if (response.getStatusCode().is4xxClientError() || response.getStatusCode().is5xxServerError()) {
      try (BufferedReader reader = new BufferedReader(new InputStreamReader(response.getBody()))) {
        String httpBodyResponse = reader.lines().collect(Collectors.joining(""));

        // TODO deserialize (could be JSON, XML, whatever...) httpBodyResponse to a POJO that matches the error structure for that specific API, then extract the error message.
        // Here the whole response will be treated as the error message, you probably don't want that.
        String errorMessage = httpBodyResponse;

        throw new MyRestTemplateException(DownstreamApi.MY_API_1, response.getStatusCode(), errorMessage);
      }
    }
  }
}
{% endhighlight %}

### DAO

The DAO will make the REST call by using RestTemplate. The RestTemplate instance is created in a way it is using the custom RestTemplate Error Handler we defined earlier.

{% highlight java %}
@Component
public class MyDao {

  // This is the RestTemplate for DownstreamApi.MY_API_1
  private RestTemplate restTemplateApi1;

  public MyDao(RestTemplateBuilder restTemplateBuilder) {
    this.restTemplateApi1 = restTemplateBuilder
        .errorHandler(new MyApiRestTemplateErrorHandler())
        .build();
  }
  
  public void updateStuff(String param1) {
    URI uri = UriComponentsBuilder
        .fromUriString("https://downstream-api.com/stuff/{param}")
        .build(param1);

    RequestEntity<Void> requestEntity = RequestEntity
        .post(uri)
        .build();

    restTemplateApi1.exchange(requestEntity, Object.class);
  }
  
  // TODO other API calls
  
}
{% endhighlight %}

### Controller advice

Once you have converted the RestTemplate exceptions to MyRestTemplateException, you have to catch them in a global Exception Handler and convert it to a "generic" error response (here ErrorResponse.java)

Here is the "generic" error response POJO:

{% highlight java %}
public class ErrorResponse {

  private String timestamp;

  /** HTTP Status Code */
  private int status;

  /** HTTP Reason phrase */
  private String error;

  /** A message that describe the error thrown when calling the downstream API */
  private String message;

  /** Downstream API name that has been called by this application */
  private DownstreamApi api;

  /** URI that has been called */
  private String path;

  public ErrorResponse(MyRestTemplateException ex, String path) {
    this.timestamp = DateTimeFormatter.ISO_LOCAL_DATE_TIME.format(LocalDateTime.now());
    this.status = ex.getStatusCode().value();
    this.error = ex.getStatusCode().getReasonPhrase();
    this.message = ex.getError();
    this.api = ex.getApi();
    this.path = path;
  }

  // TODO getters ... 
  // TODO toString ...
}
{% endhighlight %}

Then defined the error handler in a @ControllerAdvice class and you are good to go!

{% highlight java %}
@ControllerAdvice
public class MyExceptionHandler extends ResponseEntityExceptionHandler {

  private static final Logger LOGGER = LoggerFactory.getLogger(MyExceptionHandler.class);

  @ExceptionHandler(value = MyRestTemplateException.class)
  ResponseEntity<ErrorResponse> handleMyRestTemplateException(MyRestTemplateException ex, HttpServletRequest request) {
    LOGGER.error("An error happened while calling {} Downstream API: {}", ex.getApi(), ex.toString());
    return new ResponseEntity<>(new ErrorResponse(ex, request.getRequestURI()), ex.getStatusCode());
  }
}
{% endhighlight %}

### Controller layer

{% highlight java %}
@RestController
public class MyController {

  private final MyDao dao;

  MyController(MyDao dao){
    this.dao = dao;
  }

  @PostMapping("/update-stuff")
  public void updateStuff() {
    return dao.updateStuff("blabla");
  }
{% endhighlight %}

### Sample of error returned

Here is the error response that would be returned when calling `POST /update-stuff` if the downstream API "MY_API1" throws an error:
 
{% highlight json %}
{
  "timestamp": "2019-06-07T19:51:30.907",
  "status": 404,
  "error": "Not Found",
  "message": "The stuff 'blabla' has not been found",
  "api": "MY_API_1",
  "path": "/update-stuff"
}
{% endhighlight %}

Tested with Spring Boot 2.1.5.RELEASE