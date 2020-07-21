FROM ubuntu:18.04
#NV WORKDIR /usr/src/app/
RUN apt update && apt install maven openjdk-8-jdk -y jetty9 curl
RUN update-java-alternatives --set /usr/lib/jvm/java-1.8.0-openjdk-amd64

COPY . /var/lib/jetty/webapps
WORKDIR "/var/lib/jetty/webapps"
RUN mvn clean package
RUN curl https://files.trendmicro.com/products/CloudOne/ApplicationSecurity/1.0.2/agent-java/trend_app_protect-4.2.0.jar -o /var/lib/jetty/webapps/target/webbank/WEB-INF/lib/trend_app_protect-4.2.0.jar

EXPOSE 8080
CMD mvn jetty:run
