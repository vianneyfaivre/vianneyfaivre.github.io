---
layout: post
title: "Spring - How to connect to RabbitMQ"
categories: [tech]
---

Here is a snippet to test the connectivity between your machine and a RabbitMQ instance.

{% highlight java %}

public static void main(String[] args) {

    String queueName = "YOUR QUEUE";

    ConnectionFactory factory = new ConnectionFactory();
    factory.setUsername("YOUR USERNAME");
    factory.setPassword("YOUR PASSWORD");
    factory.setVirtualHost("/");
    factory.setHost("your-rabbit-host.com");
    factory.setPort(5672);

    try (Connection conn = factory.newConnection()) {
        Channel channel = conn.createChannel();

        AMQP.Queue.DeclareOk response = channel.queueDeclarePassive(queueName);
        int msgCount = response.getMessageCount();
        int consumerCount = response.getConsumerCount();

        System.out.println("msg="+msgCount+" consumers="+consumerCount);
    } catch (Exception e) {
        System.err.println(e.getMessage());
        e.printStackTrace();
    }
}

{% endhighlight %}

Tested with Spring Boot 2 and `spring-rabbit` version `1.7.4.RELEASE`