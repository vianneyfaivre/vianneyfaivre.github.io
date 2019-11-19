---
layout: post
title: Java keytool/openssl useful commands
categories: [tech]
---
Here are some useful commands when manipulating Java keystores. (I will update this post from time to time)

(default keystore password: `changeit`)

<h3>Import a certficate into a Java keystore</h3>

{% highlight shell %}keytool -import -keystore /jre/lib/security/cacerts -file mycertificate.der{% endhighlight %}

<h3>Create a truststore from a PEM file</h3> 

{% highlight shell %}keytool -import -file CA-Certificates.pem -alias firstCA -keystore truststore.pkcs12{% endhighlight %}

<h3>Create a truststore from a CER file</h3>

{% highlight shell %}keytool -keystore truststore.jks -import -file my-cert.cer{% endhighlight %}

<h3>Import a list of certificates into a Java keystore</h3>

{% highlight shell %}
#!/bin/bash

for file in /app/certs/* 
do
    if [[ -f $file ]]; then
        keytool -noprompt -storepass changeit -import -keystore $JAVA_HOME/jre/lib/security/cacerts -file $file -alias $file
    fi
done
{% endhighlight %}

<h3>List the certificates of a keystore in a file report.txt</h3>

{% highlight shell %}keytool -list -v -keystore /jre/lib/security/cacerts > report.txt{% endhighlight %}

<h3>Get TLS certificate from an endpoint</h3>

{% highlight shell %}
openssl s_client -connect b-2.k01-tst-cluster.kaocgp.c2.kafka.ap-southeast-2.amazonaws.com:9094 > out.txt

# in out.txt: extract text starting from -----BEGIN CERTIFICATE----- to -----END CERTIFICATE----- and save it as a .cer file
{% endhighlight %}

<h3>Create a PKCS12 keystore with a Certificate+Private Key and a CA Root Certificate</h3>

{% highlight shell %}openssl pkcs12 -export -in my-certificate.crt -inkey my-private-key.key -out keystore.pkcs12 -name camp.cogeco.com -CAfile ca-certificate.crt -caname root{% endhighlight %}

<h3>Create a PKCS12 keystore with a Certificate+Private Key</h3>

{% highlight shell %}
cat private-key.key certificate-chain.crt > fullcertif.pem.txt
openssl pkcs12 -export -in fullcertif.pem.txt -out keystore.pkcs12 -name sub.your.domain.com -noiter -nomaciter
rm fullcertif.pem.txt
{% endhighlight %}
