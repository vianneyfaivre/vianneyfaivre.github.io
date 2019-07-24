---
layout: post
title: "Spring Boot - How to use JUnit Parameterized tests"
categories: [tech]
---

JUnit Parameterized tests can be used within Spring Boot, there are only a couple of things that changes when you use `@RunWith(Parameterized.class)` instead of `@RunWith(SpringRunner.class)`

### 1. Enable JUnit Parameterized feature

Annotate the test class with: `@RunWith(Parameterized.class)`

### 2. Enable Spring Boot Testing

Annotate the test class with:

{% highlight java %}
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.MOCK)
@AutoConfigureMockMvc
{% endhighlight %}

Add the following attributes to the test class:

{% highlight java %}
@ClassRule public static final SpringClassRule SPRING_CLASS_RULE = new SpringClassRule();
@Rule public final SpringMethodRule springMethodRule = new SpringMethodRule();
@Autowired MockMvc mvc;
{% endhighlight %}

### 3. Define the test cases data

JUnit uses a 2d Array to store the test cases data.

Add the following attribute to the test class:

{% highlight java %}
private final static Object[][] TEST_CASES = new Object[][] {
  // i, j, i*j, i+j
  {2, 3, 6, 5},
  {1, 0, 0, 1},
  {2, 1, 2, 3}
};
{% endhighlight %}

For each test case a instance of the current class will be instantiated.

{% highlight java %}
private int i;
private int j;
private int multiplyResult;
private int addResult;

public ParamtestsApplicationTests(int i, int j, int multiplyResult, int addResult) {
  this.i = i;
  this.j = j;
  this.multiplyResult = multiplyResult;
  this.addResult = addResult;
}

@Parameterized.Parameters(name = "This is my Test - {0}")
public static Collection<Object[]> data() {
  return Arrays.asList(TEST_CASES);
}
{% endhighlight %}

### 4. Write the actual tests

Now that all the data has been set, you can create the @Test methods that will be called for each test case.

{% highlight java %}
@Test
public void multiply() throws Exception {
  this.mvc.perform(
    get("/multiply")
      .param("i", String.valueOf(this.i))
      .param("j", String.valueOf(this.j)))
      .andExpect(content().string(String.valueOf(this.multiplyResult)));
}

@Test
public void add() throws Exception {
  this.mvc.perform(
    get("/add")
      .param("i", String.valueOf(this.i))
      .param("j", String.valueOf(this.j)))
      .andExpect(content().string(String.valueOf(this.addResult)));
}
{% endhighlight %}

Tested with `Spring Boot 2.1.5.RELEASE`