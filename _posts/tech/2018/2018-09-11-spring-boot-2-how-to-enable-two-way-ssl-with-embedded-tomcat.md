---
layout: post
title: "Spring Boot 2: How to enable two-way SSL with embedded Tomcat"
categories: [tech]
---
In Spring Boot 2, the configuration classes of embedded webservers (like Tomcat) have slightly changed.

Below is a way to enable a <a href="https://www.ibm.com/support/knowledgecenter/SSRMWJ_7.0.1.8/com.ibm.isim.doc/securing/cpt/cpt_ic_security_ssl_scenario.htm" target="_blank" rel="noopener">two-way SSL</a> connector on Tomcat.

<!--more-->

Versions used:

<ul>
<li>Spring Boot 2.0.4.RELEASE</li>
<li>Embedded Tomcat version: 8.5.32</li>
</ul>

{% highlight java %}
package re.vianneyfaiv.twowayssl;

import org.apache.catalina.connector.Connector;
import org.apache.commons.lang3.StringUtils;
import org.apache.coyote.http11.Http11NioProtocol;
import org.apache.tomcat.util.net.SSLHostConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.web.ServerProperties;
import org.springframework.boot.web.embedded.tomcat.TomcatServletWebServerFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.io.File;
import java.nio.file.Paths;

@Configuration
public class TomcatWithTwoWaySslConfig {

  @Autowired
  private ServerProperties serverProperties;

  private int port = 9090;

  private String keystoreFile = "/absolute/path/to/keystore";
  private String keystorePassword = "keystore-password";

  private String truststoreFile = "/absolute/path/to/truststore";
  private String truststorePassword = "truststore-password";

  @Bean
  public TomcatServletWebServerFactory servletContainer() {

    // Creates default Spring Boot Tomcat config with default HTTP(s) Connector based on ServerProperties (server.* props)
    TomcatServletWebServerFactory tomcat = new TomcatServletWebServerFactory(serverProperties.getPort());

    // Defines application context path (if set)
    if(StringUtils.isNotBlank(serverProperties.getServlet().getContextPath())) {
      tomcat.setContextPath(serverProperties.getServlet().getContextPath());
    }

    // Creation of a new HTTPS connector
    tomcat.addAdditionalTomcatConnectors(twoWaySSL(port, keystoreFile, keystorePassword, truststoreFile, truststorePassword));

    return tomcat;
  }

  private static Connector twoWaySSL(int port,
                     String keystoreFile, String keystorePassword,
                     String truststoreFile, String truststorePassword) {

    // Create HTTP connector
    Connector connector = new Connector(TomcatServletWebServerFactory.DEFAULT_PROTOCOL);
    connector.setPort(port);
    Http11NioProtocol protocol = (Http11NioProtocol) connector.getProtocolHandler();

    // Enable SSL
    connector.setScheme("https");
    connector.setSecure(true);
    protocol.setSSLEnabled(true);

    // Keystore config
    File keystore = Paths.get(keystoreFile).toFile();
    protocol.setKeystoreFile(keystore.getAbsolutePath());
    protocol.setKeystorePass(keystorePassword);

    // Truststore config
    File truststore = Paths.get(truststoreFile).toFile();
    protocol.setTruststoreFile(truststore.getAbsolutePath());
    protocol.setTruststorePass(truststorePassword);

    // Enable two way SSL
    protocol.setClientAuth(SSLHostConfig.CertificateVerification.REQUIRED.name());
    protocol.setSSLVerifyClient(SSLHostConfig.CertificateVerification.REQUIRED.name());

    return connector;
  }
}
{% endhighlight %}

Let me know if that does not work for you.
