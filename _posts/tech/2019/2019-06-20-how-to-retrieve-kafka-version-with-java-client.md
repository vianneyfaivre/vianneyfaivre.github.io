---
layout: post
title: "How to retrieve Kafka version with Java client"
categories: [tech]
---

Here is a way to retrieve the version of Kafka using the Java client.

{% highlight java %}
Map<String, Object> config = new HashMap<>();
config.put(ConsumerConfig.BOOTSTRAP_SERVERS_CONFIG, "my-kafka-server1:9090,my-kafka-server2:9090");
config.put(ConsumerConfig.CLIENT_ID_CONFIG, "my-admin-client");
config.put(ConsumerConfig.KEY_DESERIALIZER_CLASS_CONFIG, StringDeserializer.class);
config.put(ConsumerConfig.VALUE_DESERIALIZER_CLASS_CONFIG, StringDeserializer.class);

try (AdminClient client = KafkaAdminClient.create(config)) {

    String version = client.metrics()
        .entrySet().stream()
        .filter(e -> "app-info".equals(e.getKey().group()) && "version".equals(e.getKey().name()))
        .map(e -> e.getValue().metricValue().toString())
        .findFirst()
        .orElse("VERSION-NOT-FOUND");

    System.out.println("Kafka version = " + version);
}
{% endhighlight %}

Version of the Java Kafka client used:

{% highlight xml %}
<dependency>
    <groupId>org.apache.kafka</groupId>
    <artifactId>kafka_2.12</artifactId>
    <version>2.2.1</version>
</dependency>
{% endhighlight %}

Tested with Kafka Client 2.2.1